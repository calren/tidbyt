load("render.star", "render")
load("http.star", "http")
load("encoding/base64.star", "base64")

# Load emojis from base64 encoded data
IMAGE = base64.decode("""
iVBORw0KGgoAAAANSUhEUgAAAEAAAAAgCAYAAACinX6EAAAAAXNSR0IArs4c6QAAAdBJREFUaEPtmMF1wyAMhssKHQkvkGNH6AadJRv0lkPPZoyM0RXcR1r5KbIEEjE8aJxTYgRCH78kHPfy5B9H41++3xaOiXv9vNmmxrmxOA8/h3U03GEeN4eOUd9aPyIAaYHoyDoGc6wgJHv6XDoUgJyCwQJITXgEAGwotQZWBgcOB4XHtSdOlbc7AOwApw3eYEraHAAMLn6n62qBsqm9dw2Q8pU+10DIBZZSyOak/2pYdQVoAGhrgQVAlykAcs11FqkjdAsg1Sa5sRYAcG3QtNi1mFqMW9tqFQD3k5I02HSBvYL03rMXKmn9EIJ5LxhQ6V3A7JQLQAp2nmcVz2maWLsSKCqHyKgIwKMB5zbZEkgxgOzpnu+Xvr7/hv1xObHxf50ud88BAviJv2soohsAMXoKARPpDkDcXEoFV8ezlRRwABhRASGEVaXLwnc9rARN/juiHO/96qOrGhB3hQHQyiYB2byMCKkCdsMCyLU6yzhAGEoBlgA1thHCAaDgupyDW3wPyNWAnGPLeLcp0AJC10UQn2KqI1hOO9rioImPIsWm/O+2oPSClAPDBVuj2EkQdgPAOdD+J9Ay4M09xCrP/2ZfVQEjwDoAjHBKNff49Ar4AW6cnDA7ZI84AAAAAElFTkSuQmCC
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
