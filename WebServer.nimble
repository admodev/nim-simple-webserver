# Package

version       = "0.1.0"
author        = "admodev"
description   = "A simple web server"
license       = "MIT"
srcDir        = "src"
bin           = @["WebServer"]


# Dependencies

requires "nim >= 1.6.6", "jester", "norm"
