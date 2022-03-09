class QueryMutationAuth {
  String addAuth(String email, String password, String macAddress) {
    return """
      mutation{
          addAuth(email: "$email", password: "$password", macaddress: "$macAddress"){
            email
            password
            macaddress
          }
      }
    """;
  }

  String getAll() {
    return """ 
      {
        persons{
          id
          name
          lastName
          age
        }
      }
    """;
  }

  String deletePerson(id) {
    return """
      mutation{
        deletePerson(id: "$id"){
          id
        }
      } 
    """;
  }

  String editPerson(String id, String name, String lastName, int age) {
    return """
      mutation{
          editPerson(id: "$id", name: "$name", lastName: "$lastName", age: $age){
            name
            lastName
          }
      }    
     """;
  }
}
