import htmlgen
import jester
import norm/[model, sqlite]

# Typedefs for domain model
type
  Employee = ref object of Model
    firstName, lastName: string
    company: Company
  Company = ref object of Model
    name: string

func newCompany(name = ""): Company =
  Company(name: name)

func newEmployee(firstName = "", lastName = "", company = newCompany()): Employee =
  Employee(firstName: firstName, lastName: lastName, company: company)

routes:
  get "/":
    resp h1("Welcome to the server!")