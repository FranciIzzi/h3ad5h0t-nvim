local ls = require("luasnip")
local i = ls.insert_node
local t = ls.text_node
local s = ls.snippet

local html_snippets = {
	s("div", { t("<div>"), i(1), t("</div>") }),
	s("span", { t("<span>"), i(1), t("</span>") }),
	s("h1", { t("<h1>"), i(1), t("</h1>") }),
	s("h2", { t("<h2>"), i(1), t("</h2>") }),
	s("h3", { t("<h3>"), i(1), t("</h3>") }),
	s("h4", { t("<h4>"), i(1), t("</h4>") }),
	s("h5", { t("<h5>"), i(1), t("</h5>") }),
	s("h6", { t("<h6>"), i(1), t("</h6>") }),
	s("p", { t("<p>"), i(1), t("</p>") }),
	s("a", { t('<a href="">'), i(1), t("</a>") }),
	s("button", { t("<button>"), i(1), t("</button>") }),
	s("table", { t("<table>"), i(1), t("</table>") }),
	s("tr", { t("<tr>"), i(1), t("</tr>") }),
	s("td", { t("<td>"), i(1), t("</td>") }),
	s("ol", { t("<ol>"), i(1), t("</ol>") }),
	s("ul", { t("<ul>"), i(1), t("</ul>") }),
	s("li", { t("<li>"), i(1), t("</li>") }),
	s("script", { t("<script>"), i(1), t("</script>") }),
	s("style", { t("<style>"), i(1), t("</style>") }),
	s("header", { t("<header>"), i(1), t("</header>") }),
	s("main", { t("<main>"), i(1), t("</main>") }),
	s("nav", { t("<nav>"), i(1), t("</nav>") }),
	s("section", { t("<section>"), i(1), t("</section>") }),
	s("article", { t("<article>"), i(1), t("</article>") }),
	s("footer", { t("<footer>"), i(1), t("</footer>") }),
	s("aside", { t("<aside>"), i(1), t("</aside>") }),
	s("form", { t("<form>"), i(1), t("</form>") }),
	s("html", {
		t({
			"<!DOCTYPE html>",
			'<html lang="en">',
			"<head>",
			'\t<meta charset="UTF-8">',
			'\t<meta name="viewport" content="width=device-width, initial-scale=1.0">',
			"\t<title>Document</title>",
			"</head>",
			"<body>",
			"\t",
			"</body>",
			"</html>",
		}),
	}),
}

ls.add_snippets("html", html_snippets)
ls.add_snippets("javascriptreact", html_snippets)
ls.add_snippets("typescriptreact", html_snippets)
