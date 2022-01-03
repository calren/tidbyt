load("render.star", "render")
load("http.star", "http")
load("encoding/base64.star", "base64")

# Load emojis from base64 encoded data
WINKY_EMOJI = base64.decode("""
iVBORw0KGgoAAAANSUhEUgAAAA8AAAAPCAYAAAA71pVKAAAAAXNSR0IArs4c6QAAAGFJREFUOE9jZKAAMJKi96Vc8n+QevFHc8H6wARMENkgmAKYGLpGojVj00iUZlwaaa8ZOUzQw4Ho0MYZYMRGF9aoIlYzujq4s/GFKq64pq5mYryAkjxxJVFcBmFoJsZGdDUAHyZMELTxs5MAAAAASUVORK5CYII=
""")

OCTO_1 = base64.decode("""
iVBORw0KGgoAAAANSUhEUgAAAA8AAAAPCAYAAAA71pVKAAAAAXNSR0IArs4c6QAAAIVJREFUOE+tUlsOgDAIc9E/PZ+eUc+nfxqXLqlhyJZJ3M/Co1CgoVOvX/db+2hfyxRkLDNqQKvAA24B6gIv8DmPKWfYjvRrGz7S/xdcWpb0Fzu7wADppWFezl7dNoPuO1vdSwKB/9OdTYWRKoKtYkFuJs8abbc8SResJPXUWdKmbQHkSIhHXnRfEP4eWB0AAAAASUVORK5CYII=
""")

OCTO_2 = base64.decode("""
iVBORw0KGgoAAAANSUhEUgAAAA8AAAAPCAYAAAA71pVKAAAAAXNSR0IArs4c6QAAAINJREFUOE9jZEADzCu//EcXg/H/hvMwIsuhcPBpxGYAXDMxGtENwND8J4wbrIZl1Vcwjc4HicGcT13NuAILWRynzWRpBmlCDzSQf2F+xxvaMEmy4xmb7cg2IhsM8jfJ8YycysCaYSaCJAglFgzNyCFMlmZiAgqkBq+zYd6AKULWgB5gAFG3YxASxyryAAAAAElFTkSuQmCC
""")

OCTO_3 = base64.decode("""
iVBORw0KGgoAAAANSUhEUgAAAA8AAAAPCAYAAAA71pVKAAAAAXNSR0IArs4c6QAAAIZJREFUOE+tklEOgCAMQyX6p+fTM+r59E+jKUnNqEDIIj9kgze6jtDJ6tf91hzja5mCPUuCGpgr8MItoBb4wOc8xjvDdsRdY+Qo/1+4ZJbNF192wYDUNPTL3otuE4Ic15wB1WD9IFDimjPHlfywXN9qoFXnglmwSTb7pS8JbN2m9BxgJ4HzB60VZa+R7qYSAAAAAElFTkSuQmCC
""")


def main():

    return render.Root(
    delay=200,
    child = render.Box( # This Box exists to provide vertical centering
        render.Row(
            expanded=True, # Use as much horizontal space as possible
            main_align="space_evenly", # Controls horizontal alignment
            cross_align="center", # Controls vertical alignment
            children = [
            render.Animation(
              children=[
                render.Image(src=OCTO_1),
                render.Image(src=OCTO_2),
                render.Image(src=OCTO_3),
                ],
              ),
                render.WrappedText(
                  content="HELLO, RAYMOND")
                  ],
        ),
    ),
)
