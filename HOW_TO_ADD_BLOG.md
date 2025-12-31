# How to Add a New Blog Post

Adding a new blog post to the SilverPrice website is a simple two-step process. Follow these instructions to ensure your new post is formatted correctly and links back to the dashboard properly.

## Step 1: Create the Blog File

1.  **Duplicate the Template**:
    *   Navigate to the `Blogs` folder.
    *   Copy the file named `BLOG_TEMPLATE.html`.
    *   Paste it and rename the copy to your new filename (e.g., `4_blog.html`, `5_blog.html`, etc.).

2.  **Edit the New File**:
    *   Open your new file (e.g., `4_blog.html`) in your code editor.
    *   Look for comments starting with `<!-- REPLACE: ... -->`. These mark the sections you need to update.
    *   **Page Title**: Update the `<title>` tag at the top.
    *   **Headline**: Change the `<h1>` tag content.
    *   **Author Details**: Update the name, date, and avatar image URL in the `<div class="meta-header">` section.
    *   **Main Image**: Update the `src` attribute of the main `<img>` tag.
    *   **Content**: Replace the content inside `<article class="post-body">` with your new article text.
    *   **Author Box**: Update the author bio at the bottom of the article.

3.  **Save** your changes.

---

## Step 2: Update the Homepage (index.html)

1.  Open the `index.html` file in the root directory.
2.  Search for the `<section class="blog-section" id="news">`.
3.  You will see a list of `<article class="blog-card">` items.
4.  **Copy** one of the existing blog card blocks (from `<article class="blog-card">` to `</article>`).
5.  **Paste** it into the list where you want it to appear (usually at the top if it's the newest post).
6.  **Update the Details**:
    *   **Image**: Change the `src` URL to match your blog post's image.
    *   **Badge**: Update the `<span class="blog-badge">` text (e.g., "Market", "Analysis", "News").
    *   **Title**: Update `<div class="blog-title">` with your new post's title.
    *   **Excerpt**: Update `<p class="blog-excerpt">` with a short summary.
    *   **Link**: **Crucial Step** — Update the `href` attribute in the "Read More" link to point to your new file path (e.g., `href="/Blogs/4_blog.html"`).

## Checklist
- [ ] Blog file created from template.
- [ ] Title, content, and author updated in blog file.
- [ ] Footer links in blog file point to `../index.html` (Template handles this).
- [ ] New card added to `index.html`.
- [ ] Link in `index.html` points to the new blog file.
