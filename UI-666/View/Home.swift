//
//  Home.swift
//  UI-666
//
//  Created by nyannyan0328 on 2022/09/11.
//

import SwiftUI

struct Home: View {
    @State var currentTab : Tab = .home
    @State var currentIndex : Int = 0
      @Namespace var animation
    var body: some View {
        VStack{
            
            HeaderView()
            
            SeachView()
            
            (
            
                Text("Featured").font(.system(size: 60).weight(.ultraLight)).foregroundColor(.green.opacity(0.8))
                              +
                
                Text(" Movie").foregroundColor(.green)
                
                    
            
            )
              .frame(maxWidth: .infinity,alignment: .leading)
            
            CustomCrouselView(index: $currentIndex, items: movies, spacing: 10, id: \.id) { moive, cardSize in
                
                Image(moive.artwork)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: cardSize.width,height: cardSize.height)
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            }
            .padding(.horizontal,-15)
            .padding(.vertical)
            
            
            TabBar()
            
        }
        .padding([.horizontal,.top],15)
    
        .background{
         
            GeometryReader{proxy in
                
                let size = proxy.size
             
                TabView(selection: $currentIndex) {
                    
                    ForEach(movies.indices,id:\.self){index in
                        
                        Image(movies[index].artwork)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: size.width,height: size.height)
                            .clipped()
                    }
                    
                    
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                
                Rectangle()
                    .fill(.ultraThickMaterial)
                
                LinearGradient(colors: [
                    .clear,
                    Color("BGTop"),
                    Color("BGBtom")
                    
                
                
                ], startPoint: .top, endPoint: .bottom)
               
            }
            .ignoresSafeArea()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity,alignment: .top)
        
    }
    @ViewBuilder
    func TabBar ()->some View{
        
        HStack{
            
            ForEach(Tab.allCases,id:\.self){tab in
                
                VStack{
                    
                    Image(tab.rawValue)
                        .resizable()
                        .renderingMode(.template)
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 20,height: 20)
                      .frame(maxWidth: .infinity,alignment: .center)
                    
                    if currentTab == tab{
                        
                        Circle()
                            .fill(.red)
                         .frame(width: 5,height: 5)
                         .matchedGeometryEffect(id: "TAB", in: animation)
                            
                    }
                }
            
                .onTapGesture {
                    
                    withAnimation{
                        
                        currentTab = tab
                    }
                }
                
            }
        }
        
        
    }
    @ViewBuilder
    func SeachView ()->some View{
     
        HStack{
            
              Image(systemName: "magnifyingglass")
            
            TextField("Seach", text: .constant(""))
            
             Image(systemName: "mic")
        }
        .padding(.vertical)
        .padding(.horizontal)
        .background{
         RoundedRectangle(cornerRadius: 23, style: .continuous)
                .fill(.ultraThickMaterial)
        }
        
    }
    @ViewBuilder
    func HeaderView ()->some View{
        
        HStack{
            
            VStack(alignment:.leading,spacing: 10){
                
               Text("Hello Nyan Nyan")
                    .font(.title2.bold())
                
                Text("Book your Fravorite Movie")
                    .font(.title.weight(.ultraLight))
                    .foregroundColor(.gray)
                
            }
              .frame(maxWidth: .infinity,alignment: .leading)
            
            
            Button {
                
            } label: {
             
                Image("p1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                     .frame(width: 50,height: 50)
                     .clipShape(Circle())
                
            }
        }
        
        
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
