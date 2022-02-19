//
//  ContentView.swift
//  login
//
//  Created by SUshil on 18/02/22.
//

import SwiftUI

struct ContentView: View {
    @State var email = "sushil@gmail.com"
    @State var pass = ""
    @State var loginStatus = false
    var body: some View {
        VStack{
            if (!loginStatus){
                Login(email: $email, pass: $pass)
            }else{
                NavUIView()
            }
        }
    }
}
//login page
struct Login: View{
    @Binding var email:String
    @Binding var pass:String
    
    @State var prst = false
    @AppStorage("status") var loginStatus = false
    
    let tempemail = "sushil@gmail.com"
    let temppass = "123456"
    
    var body: some View{
        VStack{
            Text("Login")
                .font(.largeTitle)
                .bold()
            TextField("Email",text:$email)
                .padding()
                .background(.gray)
                .padding(.bottom,10)
            
            TextField("password",text:$pass)
                .padding()
                .background(.gray)
                .padding(.bottom,10)
            Text("LogIn")
                .padding()
                .foregroundColor(Color.white)
                .background(.blue)
                .cornerRadius(10)
                .onTapGesture {
                    if(email == tempemail && pass == temppass){
                        print("yes")
                        loginStatus.toggle()
                    }else{
                        print("fail")
                        prst.toggle()
                    }
                }
            
            /*Button(action: {
                if(email == tempemail && pass == temppass){
                    print("yes")
                    loginStatus.toggle()
                }else{
                    print("fail")
                    prst.toggle()
                }
            }, label: {
                Text("Submit")
                    .font(.largeTitle)
            })*/
            Spacer()
        }
        .alert(isPresented: $prst, content:{
            Alert(title:Text( "incorrect"),message:Text("you have entered wrong password"),dismissButton:.default(Text("OK")))
            
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
