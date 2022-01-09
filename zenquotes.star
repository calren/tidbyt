load("render.star", "render")
load("http.star", "http")
load("cache.star", "cache")

RANDOM_QUOTE_URL = "https://zenquotes.io/api/random"

def main():
    rep = http.get(RANDOM_QUOTE_URL)
    if rep.status_code != 200:
        fail("Zen quotes request failed with status %d", rep.status_code)

    quote = rep.json()[0]["q"]
    author = rep.json()[0]["a"]
    cache.set("quote_rate_limit", str(quote), ttl_seconds=21600)
    cache.set("quote_author_rate_limit", str(author), ttl_seconds=21600)

    return render.Root(
      delay=100,
      child = render.Column(
          children = [
              render.Box(
                padding = 3,
                child = render.Marquee(height = 32, scroll_direction = "vertical",
                    child = render.WrappedText(
                        content = quote,)
                          )
                      )
            ],
        )
    )
