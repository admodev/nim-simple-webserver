import htmlgen
import jester

routes:
  get "/":
    resp h1("Welcome to the server!")