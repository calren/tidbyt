load("render.star", "render")
load("time.star", "time")

quotes = [
  "It never ceases to amaze me: we all love ourselves more than other people, but care more about their opinion than our own.",
  "The best revenge is not to be like your enemy.",
  "Choose not to be harmed — and you won’t feel harmed. Don’t feel harmed — and you haven’t been.",
  "If a man knows not which port he sails, no wind is favorable.",
  "No person has the power to have everything they want, but it is in their power not to want what they don’t have, and to cheerfully put to good use what they do have."
]

def main(config):
    # get time to generate random number
    timezone = config.get("timezone") or "America/New_York"
    now = time.now().in_location(timezone)

    # convert time to int after formatting time in x:xx
    timeInt = int(now.format("304"))

    hi = len(quotes) - 1
    # generate random number from time number
    randomNumber = (timeInt % (hi + 1))

    return render.Root(
        delay = 200,
        child = render.Marquee(
          width=64,
          offset_start=5,
          offset_end=32,
          scroll_direction="vertical",
          height=500,
          child=render.WrappedText(
            content=quotes[randomNumber]),
            width=50,
          )
    )
