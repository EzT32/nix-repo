from pygments.style import Style
from pygments.token import Keyword, Name, Comment, String, Error, Number, Operator, Generic, Text

class Dark(Style):
    default_style = ""
    styles = {
        Text:              "#fbf1c7",  # fg0
        Keyword:           "#458588",  # darkblue
        Name:              "#b16286",  # darkpurple
        Comment:           "#928374",  # darkgray
        String:            "#98971a",  # darkgreen
        Number:            "#d79921",  # darkyellow
        Operator:          "#d65d0e",  # darkorange
        Generic.Error:     "#cc241d",  # darkred
    }
