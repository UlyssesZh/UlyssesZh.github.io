---
layout: home
pagination:
  enabled: true
rendering_priority: lowest
---

<div id="mastodon-post" class="mastodon"></div>

{% assign mastodon = site.minima.social_links | where: 'platform', 'mastodon' | first %}
<script>(async () => {

function attributeEscape(string) {
	return string.replace(/"/g, '&quot;').replace(/'/g, '&apos;');
}

const mastodonFeedUrl = '{{ mastodon.user_url }}.rss';
const feedXml = await fetch(mastodonFeedUrl).then(response => response.text());
const feed = new DOMParser().parseFromString(feedXml, 'text/xml');
const post = feed.querySelector('item');
if (!post) {
	return;
}

const url = post.querySelector('link').textContent;
const date = new Date(post.querySelector('pubDate').textContent);
const description = post.querySelector('description').textContent; // Do I need to sanitize?
const medias = Array.from(post.getElementsByTagName('media:content')).filter(media => media.getAttribute('medium') === 'image');
const imagesHtml = medias.slice(0, 2).map(media => {
	const src = media.getAttribute('url');
	const mediaDescription = media.getElementsByTagName('media:description')[0];
	result = `<img src="${src}" class="mastodon-image"`;
	if (mediaDescription) {
		const alt = attributeEscape(mediaDescription.textContent);
		result += ` alt="${alt}" title="${alt}" `;
	}
	return result + '>';
});

const mastodonPostDom = document.getElementById('mastodon-post');
mastodonPostDom.innerHTML = `
	<h2 class="mastodon-heading"><a href="${url}" target="_blank">Latest post</a></h2>
	<div class="mastodon-post-content">
		${imagesHtml.join('')}
		<span class="mastodon-date">${date.toLocaleString(document.documentElement.lang || 'en-US')}</span>
		${description}
	</div>
	<p class="mastodon-subscribe">follow me <a href="{{ mastodon.user_url }}" target="_blank">on Mastodon</a></p>
`;
mastodonPostDom.querySelectorAll('a[rel="tag"]').forEach(tag => {
	tag.setAttribute('target', '_blank');
	tag.setAttribute('class', 'mastodon-hashtag');
});
})();</script>
