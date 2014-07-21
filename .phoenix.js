var mash = ["cmd", "ctrl"]
api.bind('[', mash, function() { Window.focusedWindow().focusWindowLeft(); });
api.bind(']', mash, function() { Window.focusedWindow().focusWindowRight(); });
