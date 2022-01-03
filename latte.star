load("render.star", "render")
load("http.star", "http")
load("encoding/base64.star", "base64")

# Load emojis from base64 encoded data
LATTE1 = base64.decode("""
iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAATRJREFUWEftlrERwjAMRaWaIRiCggVo6anCGNAROhiDVPS0LEDBEAxBbU46lDM62zLxQRrTJCKO9PzzpQRh5B+OXB8qQFWgKlAVMBU4HXZOhtV6u0c/1kNMX6fYGnTJBVSsWc36HN35Ds2mDeZERIbT6y2IKIBOxlWnS2tDAI/LxxqCTkFUgKACsWfpnGNDIiK8T1luHXfHFnK9kA0g5pNidKTaAMTiGIJiCv4GIIX9I1EUA1ASv99jrZdqCYLw50dsrT0HVN9Tv5PsOqHvCblGEIPngKgQ2n0Agp+9hvoZgDhfCoZ2L14oUiClgjUSc3YvbWTlChryuZj3902uNz7PNZ5f0Hxb8VDyjMgttmlBA8j/3xgwS4HRAfRMiH0TDPkWyFLANEjhAtMDhfnN2yvA6Aq8AGH04iFPpiCpAAAAAElFTkSuQmCC
""")

LATTE2 = base64.decode("""
iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAARNJREFUWEftlrERwjAMRaVJGII56KnCGNAROhgjqeiZgyGYRJx0l2B0tiV8IW6czokiPX9/KUGofGHl+tAAmgJNgaaAqcBwPdM0rA6nC4ZrPcT0c15bgy4bwMW6/XbOMd6f0B37aE5EFDgdb0EkAXQyqbrZWRsCeD2+Yhg6B9EAogqkzpKICPHzChGBXrP+460HrxfcAJP5woIA8jWdu4TXDLkawN8UYBnDfk+1Xq4lWIVwfqRi7Tmg+p77XckuuVkNfTFE8RyYVIjtPgIhZ78aABeKuX9xgJwK1kj0yC8bsRL9Ykiv8cKaJoAMpcCI0uORD5K+v5gC1QH0EaT+CUr+Bdwe8PikNMb0QGli73sNoLoCb2tBzSHJVrrrAAAAAElFTkSuQmCC
""")

def main():

    return render.Root(
    delay=1000,
    child = render.Box( # This Box exists to provide vertical centering
        render.Row(
            expanded=True, # Use as much horizontal space as possible
            main_align="space_evenly", # Controls horizontal alignment
            cross_align="center", # Controls vertical alignment
            children = [
            render.Animation(
              children=[
                render.Image(src=LATTE1),
                render.Image(src=LATTE2),
                ],
              )
            ]
        ),
    ),
)
