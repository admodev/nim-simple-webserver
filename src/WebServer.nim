import htmlgen
import jester
import norm/[model, sqlite]
import json

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

let dbConn = open(":memory:", "", "", "")

routes:
  get "/":
    resp h1("Welcome to the server!")
  post "/deploy":
    dbConn.createTables(newEmployee())
    var ibmCorp = newCompany("IBM")
    var fooBar = newCompany("Baz")
    var employees = [newEmployee("Employee one name", "Employee one last name", ibmCorp), newEmployee("Employee two name", "Employee two last name", fooBar)]
    dbConn.insert(employees)
    resp "Deployment complete."
  get "/employees":
    var employees = @[newEmployee()]
    dbConn.select(employees, "Employee.firstName = ?", "Employee one name")
    resp %*employees