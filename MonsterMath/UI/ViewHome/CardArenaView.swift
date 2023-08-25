//
//  CardResponsive.swift
//  Quiz Monster
//
//  Created by guntur darmawan on 17/08/23.
//

import SwiftUI

struct CardArenaView: View {
    var body: some View {
        HomeCard()
    }
}

struct HomeCard: View {
    // 40 = padding horizontal
    // 60 = 2 card to right side
    var width = UIScreen.main.bounds.width - (40 + 60)
    var height = UIScreen.main.bounds.height / 2
    
    @State var swiped = 0
//    @State var books = [
//        Book(id: 0, image: "level1", title: "Monster Arena 1 - Dust Montain", author: "Agatha Christie", rating: "Starting Point", offset: 0),
//        Book(id: 1, image: "level2", title: "Monster Arena 2 - Flow Dessert ", author: "Arthur Conan", rating: "Minimum 15", offset: 0),
//        Book(id: 2, image: "level3", title: "Monster Arena 3 - Starry Night", author: "Stieg Larsson", rating: "Minimum 25", offset: 0),
//        Book(id: 3, image: "level4", title: "Monster Arena 4 - River Pod", author: "Mario Puzo", rating: "Minimum 35", offset: 0),
//        Book(id: 4, image: "level5", title: "Monster Arena 5 - Brown Oasis", author: "Alice Sebold", rating: "Minimum 50", offset: 0),
//        Book(id: 5, image: "level6", title: "Monster Arena 6 - Night Fall", author: "Daphne Du Maurier", rating: "Minimum 70", offset: 0),
//    ]

    var body: some View {
            ZStack {
                // since its ZStack it overlay on on-top of another in reversed
                ForEach(books.reversed()) { book in
                    HStack {
                        ZStack {

                            Image(book.image)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                //.frame(width: width, height: getHeight(index: book.id))
                                .frame(width: width, height: height)
                                .cornerRadius(20)
                                .scaleEffect(getScale(index: book.id))
                            // Little Shadow
                                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 5)

          
                            // Read More Button
                            CardView(card: .constant(book))
                                .frame(width: width, height: getHeight(index: book.id))
                            
                        }
                        .offset(x: book.id - swiped < 3 ? CGFloat(book.id - swiped) * 40 : 60)
                        
                        Spacer(minLength: 0)
                    }
                    // Content shape for DragGesture
                    .contentShape(Rectangle())
                    .padding(.horizontal, 20)
                    // gesture
                    .offset(x: book.offset)
                    .gesture(DragGesture().onChanged({ value in
                        withAnimation {
                            onScroll(value: value.translation.width, index: book.id)
                        }
                    }).onEnded({ (value) in
                        withAnimation {
                            onEnd(value: value.translation.width, index: book.id)
                        } // nama
                    }))
                }
            }
            .padding(.top, 25)
            .frame(height: height)
            
            
            PageViewController(total: books.count, current: $swiped)
                .padding(.top, 25)
            
            Spacer(minLength: 0)
    
            
    }
    
    // Dynamic height change
    func getHeight(index: Int) -> CGFloat {
        // two card = 80
        // all other are 80 in the background
        
        // automatic height and offset adjusting
        return height - (index - swiped < 3 ? CGFloat(index - swiped) * 50 : 100)
    }
    
    func getScale(index: Int) -> CGFloat {
        switch index - swiped {
        case 0:
            return 1.0
        case 1:
            return 0.9
        case 2:
            return 0.8
        default:
            return 0.6
        }
    }
    
    func onScroll(value: CGFloat, index: Int) {
        if value < 0 {
            // Left Swipe
            if index != books.last!.id {
                books[index].offset = value
            }
        } else {
            // Right Swipe
            // Safe Check
            if index > 0 {
                books[index - 1].offset = -(width + 80) + value
            }
        }
    }
    
    func onEnd(value: CGFloat, index: Int) {
        if value < 0 {
            if -value > width / 2 && index != books.last!.id {
                books[index].offset = -(width + 80)
                swiped += 1
            } else {
                books[index].offset = 0
            }
        } else {
            if index > 0 {
                if value > width / 2 {
                    books[index - 1].offset = 0
                    swiped -= 1
                } else {
                    books[index - 1].offset = -(width + 80)
                }
            }
        }
    }
    
    
}

struct CardView: View {
    @Binding var card: Book
    
    var body: some View {
        
            VStack{
                
                HStack{
                    Button(action: {}) {

                        HStack{
                            Image("starGold")
                                .resizable()
                                .frame(width: 20, height: 20)

                            Text(card.rating)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                        }
                        .padding(.vertical, 9)
                        .padding(.horizontal, 16)
                        .background(Color(.black).opacity(0.3))
                        .clipShape(Capsule())
                    }
                    
                    Spacer()
                }
                
                Spacer()
                
                HStack{
                    Text(card.title)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                       
                    Spacer(minLength: 0)
                }
         
                
                HStack {
                    NavigationLink(
                        destination: ArenaView(), label: {
                                
                                HStack{
                                    Image("play")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                    
                                    
                                    Text("PLAY")
                                    
                                        .fontWeight(.bold)
                                        .foregroundColor(.yellow)
                                }
                                .padding(.vertical, 8)
                                .padding(.horizontal, 14)
                                .background(Color(.black))
                                .clipShape(Capsule())

                        })
         
                    Spacer(minLength: 0)
                }
               
            }
            .padding()
            .padding(.bottom, 10)
    }
}

// Book data

struct Book: Identifiable {
    var id: Int
    var image: String
    var title: String
    var author: String
    var rating: String
    var offset: CGFloat
}

// Paging COntrol
struct PageViewController: UIViewRepresentable {
    var total: Int
    @Binding var current: Int
    
    func makeUIView(context: Context) -> UIPageControl {
         let view = UIPageControl()
        view.numberOfPages = total
        view.currentPage = current
        view.currentPageIndicatorTintColor = .white
        view.preferredIndicatorImage = UIImage(systemName: "flame.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 22))
        view.backgroundStyle = .prominent
        
        return view
    }
    
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = current
    }
}

struct CardArenaView_Previews: PreviewProvider {
    static var previews: some View {
        CardArenaView()
    }
}



