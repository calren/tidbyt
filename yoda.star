load("render.star", "render")
load("http.star", "http")
load("encoding/base64.star", "base64")

# Load emojis from base64 encoded data
IMAGE = base64.decode("""
iVBORw0KGgoAAAANSUhEUgAAAEAAAAAgCAYAAACinX6EAAAAAXNSR0IArs4c6QAAArxJREFUaEPlmL9LHUEQx/f+ihC0CGgnEtAmClqpxBTpbAykeMQ/QTAp/FWoYJtOeaCFTToLlSSVQrQxEMQuISmUkCI2djYn82COeePuztzc5nGaa+6xu7e738/82NmXuf/8yeqqf/3oRU73Njuyl1na4LuYxloD4JsHAGXbfN9QIMkANJvNNovBIo1Gwzw/tTaKLtNGv4l5gXmDIJCKfjq64RbOHrml/j/F+9vhjBmCxdpoWfptcg/goqUcAhB8j+QdIQBl80KyHIDCwdL04VaHPmzjvzmIwd7jSh4owdf0ixs4/T6Uw0bhrZlQGnN9deNevf/rLrd/iWtjzFMr8jYpL8B+8ATx5QVxEzABiH+5/LulDTbe9fpJAWN3/nGbZhwHjbwP2qBfK55v2BfbUhvNCz4YKgBUIYi/2PrpsixzeZ67rz+G2wAM9Hy500ehaMTDhJYcIJ0WtJbAsaUBoEd44hk8JRgBZeNdsiz283cMnjkEuCpLPigLAIWg23JhMeGhijEZgJAXhMxvES8l01T9phDgAAZ7j4v98DCoIp5n+FCBoxnnOy1g00kAxKxhBSBVgr4QoBnf5+6+Oc0AcDEpH1gBaHNAaBw1SuxeUBnA+PSb/ONYt3u3f1KsuTL5zE18vnCfdjYrz0+Tn1TjSydCUg8Ay8/N97VEhwBAnxVCKGa1laCviEIL0crSZKG3U89bleDqh4Ms5gFry+euSgikyvSxeUwAYEKAQAFkjcVinby5WDkEuLty95fqAy28ZABS54AQAG2F+M8B8FOAujqeDFXdP3TT01ySHgQAXv6WKYc7BkC7kHVc7FYY+59Au545B2gXqPu42gIokwRpNYinA78R0lODGqXWALiY0F9bvjBBkbE+GFNrAFSwpsz1WfneA+CW1N4HHowH+IRo7gP3HkCnTo/a5oBOAbgFXvMaTq9avyoAAAAASUVORK5CYII=
""")

def main():

    return render.Root(
    child = render.Box( # This Box exists to provide vertical centering
        render.Row(
            expanded=True, # Use as much horizontal space as possible
            main_align="space_evenly", # Controls horizontal alignment
            cross_align="center", # Controls vertical alignment
            children = [
            render.Image(src=IMAGE)
            ]
        ),
    ),
)
