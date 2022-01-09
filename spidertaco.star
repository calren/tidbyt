load("render.star", "render")
load("http.star", "http")
load("encoding/base64.star", "base64")

# Load emojis from base64 encoded data
IMAGE1 = base64.decode("""
iVBORw0KGgoAAAANSUhEUgAAAEAAAAAgCAYAAACinX6EAAAAAXNSR0IArs4c6QAAAY1JREFUaEPtV10OgjAM7owXMPHJeANfvIInkOgZfcToCTyFNzA+mXgBImbEmlI7NmDIlO2RldHvp+1QMPClBo4fIgHRAQNnIJbAwA0Qm2AsgRBK4L5Ncp3HNT3AbJt8pDRJD50J1dnBJmIRrLRvIgBjcd8nIZ0QsFw/CkXpOo03HwprQLZFHREsAVTVVbZ/Y9Kg6ZIASwCp4pwgGu/DCa0dYAKvE0cCKHANwGT1us+DIoAqj6rtjqO3gFxpm/Vd9vHMNkR4c4BEAHUA7+6S2k2fBU0A2t83AdQhC2h+ofuKA2iyE6Hz31+znzqgKo6XR7AOwB7AOjfkeXlKKqVAk0DGnDFGmirBOiAS8JoCTRyQXW4lp4/n08IlP+8ABMBrnJcABcqB84tS8CXgMtPbxARLAL8K20DafoZM7/c6BUxJ0SsyJngGKNp/lWJSjHSWjUzX/db3gEiAK9UA0NQBNT5RO7QzB0iZIAG4J5WCS0xtlBUvRAJ8smk7i6srNcS/doCNoD72v1oCfQC0ffMJCjAZMLOTLyoAAAAASUVORK5CYII=
""")

IMAGE2 = base64.decode("""
iVBORw0KGgoAAAANSUhEUgAAAEAAAAAgCAYAAACinX6EAAAAAXNSR0IArs4c6QAAAZlJREFUaEPtV92NAiEQBmMDJj4ZO/DlWrCCM2eNPmq0Aqu4Dsw9XWIDxr2wccw4DjCArFyAx+UD9vsZZleryoeunL9qArQEVK5AK4HKAzDcJXherzoj9s92r2br1ZPuk+3+LWnMciiQ5dJlEwCwMD+UINECfHxee0fxOI6/nhw2hHwDJ6JYAbCry8vuzsmQxoMjzBHEjlOBMD53EkQJsJE3Lw4CYOKGgC3qoc+LEgA7D65tDqO7gdRpX/Ql87BnLiGCEsAJgBNAb3fO7dhnRQsA8X+1ADghC5WnZb8sAfhlJ8zNf771fpwAF46WR7EJgDuA3Nyq6x67pNZaGRFQm7NiuK5SbAKaALcuEJOAy+n3Ienj+bRPyb9PABCgNU5LABOlxOmHUvElIOnpKZhiBaCfwj6Svp8h2/q3dgEfKTr/rVTfAlyuSTCh58bgRd8Bro3xfwK4JCHHYbi9YkiFrGkChKjFYatPACdKbAmkmhGzPrkEXALAHHcZgkguTAyh0DVNgFDFJHiJuxKM5KxUTJYEpL7UkOurF+APE2gpMKHMXKUAAAAASUVORK5CYII=
""")

IMAGE3 = base64.decode("""
iVBORw0KGgoAAAANSUhEUgAAAEAAAAAgCAYAAACinX6EAAAAAXNSR0IArs4c6QAAAXtJREFUaEPtV8sNwjAMDYgFemUFLqzABFR0Ro4gmIApWIFrF0CAgmRkuU4ciEMDSY616/Z9HCcTU/iaFI7fVAKqAwpnoLZA4QYYfxPsu/ZuRbjsDmbetQM9mt0hqUuTFqdoACznOhcBkAtxbULUCViub09F8TrNNgOFLSBpYUdkSwBWdXXdvzBZ0HhxgDmAWHFKEM7XckKUA1zg7Y8DARi4BeCy+rvPsyIAKw+qbY/Tl4BUacn6IXGoGUuEigM4ArAD6O7Oqf3ps6wJAPtrE4AdsjBxozy5A0JHXqgDaL1sHQB7AHe4CQXrOxuAu7J1AEdA45j9PZoOvhxurFYCct0DfC1AVZYcYON0/UwLhMz0mJxsW4AehSWQ0mXI9f6oU0ACReNnY54XJZ9qITnvfteXH3UO8BXG9wRQKQQcl8PV0iKhEqDFJK1TvAM4Yj9tgVQi2brJWsBHAMS4zRBI8uVoElIJ0GRTqkXV5UbiXztAImiM+FdbYAyA0jcfdAIXMPfIHTwAAAAASUVORK5CYII=
""")

IMAGE4 = base64.decode("""
iVBORw0KGgoAAAANSUhEUgAAAEAAAAAgCAYAAACinX6EAAAAAXNSR0IArs4c6QAAAZxJREFUaEPtV91tAjEMThALIPGE2ICXrtAJQGVGHkEwQafoBlWfKrEA4qqcMDLGOefipAQuebz4fPl+bOesGfiyA8dvKgHVAQNnoJbAwA3w+CZ4XK8aJ8LPdm9m69WdHpPtPqtLsyanaAAs5zofARAL+6kJSU7A2/LcKorX5/jjTmEHSFrYEcUSgFV9P+2umBxovDjAHECsOCUIx6dygsoBPvDu4EAABu4A+Kze93lRBGDlQbXNYXQVkCotWT9kH3JqiUjiAI4A7ADa3Tm1Y58VTQDYPzUB2CELoxvl2R2ADzthOv/xMvuxA7riaHkU6wDoAaRzm6a5nZLWWuNIQGPOG8NNlWIdUAm4TIEYB5y+f2+cPp5PW5c8vQMAAK1xWgIYKAVOL0rFl0DITNfEFEsAvQpLIKWfId/7D50CEii6/2VMOwK6VAuJ6fvdrnjVPYAmxv8GnDIh4HwxUu5YUioBscxx70kqvbwDJDI1BEi5Y/eTloB0CCAA4rhmGBIjfafPfiWgD1vaWKouNxJf2gFaAnO8/68lkAOANucfmRQpMFT+1D4AAAAASUVORK5CYII=
""")

IMAGE5 = base64.decode("""
iVBORw0KGgoAAAANSUhEUgAAAEAAAAAgCAYAAACinX6EAAAAAXNSR0IArs4c6QAAAZdJREFUaEPtl8ENwjAMRRPEAkicEBtwYQUmAMGMHItgAqZgA8QJiQUQRanqypikNiRtA02OjWnzv5/toFXPl+65fpUMSAT03IFUAj0HoPsmeNuscpOES7ZXk83qLR+jbN8opY2+nKoBsTbqXAZALOyHNiS4AfPlo8goXsfh+i3DRhC3MBHRGoCzurjvKk1GNF42wTaBOOPUIBwfigQvAlzizcHBACzcCHCh/unzqAzAmYesbQ+DKoE00xz6kn14p68RQQiwGYAJoN3dlu1vn0VtAOAf2gBMyEz5jfLGCcCHHVk6/62c/ZiAujhaHtESAD2AdG6V569TUmutjAlozDljbFMlWgKSAeUU+IaA+/n6QvpwOi4o+XkCQACtcVoCWCgVTi9K0ZeAZKb7xERrAL0KcyK5P0Ou33c6BQiqVXt3HeqkVBFTlzUuBl+/fcWbs3jdA5IBHNdkn8uuCedioiVA4gUnTmKA5DufxAQrAclHkwFlEwSzbM0QTKqLkZgtjemEgGQASg+l4K8JkGLZZlyrJdCmMOm3npvfJTB1eBIrAAAAAElFTkSuQmCC
""")

def main():

    return render.Root(
    delay=500,
    child = render.Box( # This Box exists to provide vertical centering
        render.Row(
            expanded=True, # Use as much horizontal space as possible
            main_align="space_evenly", # Controls horizontal alignment
            cross_align="center", # Controls vertical alignment
            children = [
              render.Animation(
                children=[
                  render.Image(src=IMAGE1),
                  render.Image(src=IMAGE2),
                  render.Image(src=IMAGE3),
                  render.Image(src=IMAGE4),
                  render.Image(src=IMAGE5),
                  ],
                )
            ]
        ),
    ),
)
