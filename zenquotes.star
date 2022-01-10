load("render.star", "render")
load("http.star", "http")
load("cache.star", "cache")
load("encoding/base64.star", "base64")

RANDOM_QUOTE_URL = "https://zenquotes.io/api/random"

QUOTE_START = base64.decode("""
iVBORw0KGgoAAAANSUhEUgAAAAYAAAAGCAYAAADgzO9IAAAAAXNSR0IArs4c6QAAACtJREFUGFdjTJX//58BDcx+yMjISJQESCVMM4oOFAmQCnTjwHbAtCJLgiQAQcQYB2m3o44AAAAASUVORK5CYII=
""")

QUOTE_END = base64.decode("""
iVBORw0KGgoAAAANSUhEUgAAAAYAAAAGCAYAAADgzO9IAAAAAXNSR0IArs4c6QAAACtJREFUGFdjTJX//58BDcx+yMjIiFMCphhZAVgHTgl0o0CqQYpR7IAJgiQAMcQYB7Mu/l0AAAAASUVORK5CYII=
""")

def main():
    rep = http.get(RANDOM_QUOTE_URL)
    if rep.status_code != 200:
        fail("Zen quotes request failed with status %d", rep.status_code)

    quote = rep.json()[0]["q"]
    author = rep.json()[0]["a"]
    cache.set("quote_rate_limit", str(quote), ttl_seconds=21600)
    cache.set("quote_author_rate_limit", str(author), ttl_seconds=21600)

    return render.Root(
      delay=150,
      child = render.Column(
          children = [
              render.Box(
                padding = 3,
                child = render.Marquee(height = 28, scroll_direction = "vertical",
                    child = render.Column(
                    children = [
                    render.Image(src=QUOTE_START),
                    render.WrappedText(
                        content = quote,),
                    render.Image(src=QUOTE_END),
                      ]
                    )
                  )
                ),
            ],
        )
    )
