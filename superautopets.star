load("render.star", "render")
load("http.star", "http")
load("encoding/base64.star", "base64")

# Load emojis from base64 encoded data
IMAGE = base64.decode("""
iVBORw0KGgoAAAANSUhEUgAAAEAAAAAgCAYAAACinX6EAAAAAXNSR0IArs4c6QAAArVJREFUaEPtmD1LA0EQhjeFWkRBJSAoWImdNgERLARtLFIkiJBfICIWYuVHIRZ+VGIlkl8giMTCwkbBQpSAjXaWgoIQEkFTqEVkDuac29uPu9yuMepVm9u93XufeWd2czH2x6/YH9fP/gHoHNC79VCVjblf7Gl4gFoBACB+1+1jUOl/dO41OoSaAYD43wBBCoBaf2EsIcyC7bOiNIPCOiOVTwtT7ThzpA2SLo1V/UoAMuF0Qh4CPAP3wgBA8ceZI5bKpz3v+yMAzA+1sJ3Cm9IFFFYYAKLI8yBsQgjkABUAoAKCMfJIKagDZNantOsOQJVDmAK1WB/mfR0fcnI/O+ffaXDdugGAF9DVAR5AmK0RxbeeFjxOpK5YG3hiyb5La4Uw0C6gAkEBYDqEhUABSGrC9wMAEapToG7rCVoD6Dy8eIg+XHVxgEwgD4UKxb5axMN6uoJooxZYs5bOIaJ+HsBo4t0ddl5sdtqmITQUABsFsaEA2Dgb/CgAQeoAjMHiuHrbFTktrAEo53LCPzcd09POmtgPv6GN94NCMOUGKwBQXHty2FPrnq+vPL9F4mspnlGeiQxAFmlePP+SAOPXANCJBfEgmI5DAFGiJ3q2usekn/BiM/5voEYdIAKBwnkACIXmflQYKvE4Nw8hMgAsaCA+lhxk1esbZy1s07wX1QRTAHziJ0e+eB5eeNhSCEYBYFRxNV1qmEyDpamJ6sbui89EleyHcy++38Sgvd7ZyTYPTlzdxgFA5Mu5HBQ41w0ya5sGAOuslEquYGhQAMuzbU6fVQBB8xhTw1QKwLrgAoQAEaeXSLyTqkFfWDWOboWyQih73iQACgHSAaMPtucj7xZFEwBwDgABAPgDD/SLToAm16ZzUSeoxBtzAAWAbTzkUPG2BIvmRQiyyFtzQL0EyyDQgica8wn49YQwLYDtugAAAABJRU5ErkJggg==
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
