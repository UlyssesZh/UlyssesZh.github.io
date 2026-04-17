# frozen_string_literal: true

# make proc be able to bind to a specific receiver
class Proc
	def bind receiver
		Module.new.module_exec self do |block|
			instance_method define_method :_, &block
		end.bind receiver
	end
end

# make a module be able to check method visibility
class Module
	def method_visibility sym
		%i[public protected private].find do |visibility|
			__send__ :"#{visibility}_method_defined?", sym
		end
	end
end

# define the def_ series method
class Object
	# the method is going to be undefined soon
	def self.def_ sym, &def_block
		# pat: when refine_block is nil, it is used to represent a refinement
		# singleton: force singleton when self is a Module
		define_method :"def_#{sym}" do |method_name,
				pat = nil, singleton: false, &refine_block|
			singleton ||= !is_a?(Module)
			# mod: the module containing the old method
			# get_method: the method to get the Method/UnboundMethod obj
			# def_method: the method to define a new method
			if singleton
				mod = singleton_class
				get_method = method :method
				def_method = method :define_singleton_method
			else
				mod = self
				get_method = method :instance_method
				def_method = method :define_method
			end
			# get visibility
			visibility = mod.method_visibility method_name
			# get pat
			pat = refine_block || {
				to_sym:  ->symbol { get_method.(symbol.to_sym) },
				to_proc: :to_proc.to_proc,
				call:    ->callable { callable.method :call }
			}.each do |duck, out|
				break out.(pat) if pat.respond_to? duck
			end
			# get old
			old = get_method.(method_name)
			# override
			def_method.(method_name) do |*args, **opts, &block|
				# bind old
				old = old.bind self unless old.is_a? Method
				# bind pat
				pat = pat.bind self unless pat.is_a? Method
				# call the new method
				def_block.(old, pat, *args, **opts, &block)
			end
			# set visibility
			mod.__send__ visibility, method_name
		end
	end
	
	# use this binding to eval to avoid excessive local variable
	def self.class_binding
		binding
	end
	
	{
		after:  'result = old.(*); pat.(*); result',
		after!: 'old.(*); pat.(*)',
		before: 'pat.(*); old.(*)',
		with:   'pat.(old.(*), *)',
		chain:  'pat.(old, *)',
		and:    'old.(*) && pat.(*)',
		or:     'old.(*) || pat.(*)',
		if:     'pat.(*) && old.(*)',
		unless: 'pat.(*) || old.(*)'
	}.each do |sym, code|
		str = "def_(:#{sym}) { |old, pat, *| #{code} }"
		class_binding.eval str.gsub ?*, '*args, **opts, &block'
	end
	singleton_class.undef_method :def_, :class_binding
end
