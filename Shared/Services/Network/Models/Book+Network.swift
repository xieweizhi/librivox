//
//  Book+Network.swift
//  librivox (iOS)
//
//  Created by weizhi.
//

import Foundation
import Combine

extension Book {
    static func fetchMostDownloads() -> AnyPublisher<DocsResponse<Book>, Error> {
        Network.shared.request(.mostDownloads)
            .subscribe(on: DispatchQueue.global())
            .eraseToAnyPublisher()
    }
}


let static_book =  Book(creator: "Sun Tzu",
                        date: "2020-07-28T00:00:00Z",
                        description: "Librivox recording of The Art of War by Sun Tzu, translated by Lionel Giles. Read by Moira Fogarty. \"The Art of War is a Chinese military treatise written during the 6th century BC by Sun Tzu. Composed of 13 chapters, each of which is devoted to one aspect of warfare, it has long been praised as the definitive work on military strategies and tactics of its time. The Art of War is one of the oldest and most famous studies of strategy and has had a huge influence on both military planning and beyond. The Art of War has also been applied, with much success, to business and managerial strategies.\" (summary from Wikipedia) For more information on our readers, please visit the catalog page For more free audiobooks, or to become a volunteer reader, please visit librivox.org . Download M4B (17MB)",
                        downloads: 12,
                        identifier: "art_of_war_librivox",
                        itemSize: 2250569699,
                        runtime: "1:12:14",
                        title: "The Art of War")

let static_books = [
    Book(creator: "Catherine Carswell",
         date: "2020-07-28T00:00:00Z",
         description: "",
         downloads: 12,
         identifier: "openthedoor_2007_librivox",
         itemSize: 2250569699,
         title: "Open The Door"),

    Book(creator: "Lewis Carroll",
         date: "2020-07-28T00:00:00Z",
         description: "Librivox recording of Alice's Adventures in Wonderland, by Lewis Carroll. A children's classic! Read by: Chapter 01 Kristen McQuillin Chapter 02 Brad Bush Chapter 03 Roger W. Barnett Chapter 04 Miette Chapter 05 Mark Bradford Chapter 06 Raza Shah Chapter 07 Kara Shallenberg Chapter 08 Kristen McQuillin Chapter 09 MarinaMechanical Chapter 10 Roger W. Barnett Chapter 11 R. Francis Smith Chapter 12 Chris Goringe For further information, including links to online text, reader information, RSS feeds, CD cover or other formats (if available), please go to the LibriVox catalog page for this recording. For more information or to become a volunteer reader, please visit librivox.org/ Download M4B (84MB)",
         downloads: 11091865,
         identifier: "alice_in_wonderland_librivox",
         itemSize: 2250569699,
         title: "Alice's Adventures in Wonderland, by Lewis Carroll"),


    Book(creator: "Sun Tzu",
         date: "2020-07-28T00:00:00Z",
         description: "Librivox recording of The Art of War by Sun Tzu, translated by Lionel Giles. Read by Moira Fogarty. \"The Art of War is a Chinese military treatise written during the 6th century BC by Sun Tzu. Composed of 13 chapters, each of which is devoted to one aspect of warfare, it has long been praised as the definitive work on military strategies and tactics of its time. The Art of War is one of the oldest and most famous studies of strategy and has had a huge influence on both military planning and beyond. The Art of War has also been applied, with much success, to business and managerial strategies.\" (summary from Wikipedia) For more information on our readers, please visit the catalog page For more free audiobooks, or to become a volunteer reader, please visit librivox.org . Download M4B (17MB)",
         downloads: 12,
         identifier: "art_of_war_librivox",
         itemSize: 2250569699,
         title: "The Art of War"),


    Book(creator: "Mark Twain",
         date: "2020-07-28T00:00:00Z",
         description: "LibriVox recording of The Adventures of Tom Sawyer by Mark Twain. Read by John Greenman. The Adventures of Tom Sawyer (published 1876) is a very well-known and popular story concerning American youth. Mark Twain's lively tale of the scrapes and adventures of boyhood is set in St. Petersburg, Missouri, where Tom Sawyer and his friend Huckleberry Finn have the kinds of adventures many boys can imagine: racing bugs during class, impressing girls, with fights and stunts in the schoolyard, getting lost in a cave, and playing pirates on the Mississippi river. (Summary from Wikipedia) To see a beautiful scan of Tom Sawyer, see this version in the Internet Archive's American Libraries collection. For further information, including links to online text, reader information, RSS feeds, CD cover or other formats (if available), please go to the LibriVox catalog page for this recording. For more information or to volunteer, please visit LibriVox.org . Download M4B Part 1 32kbps (26MB) Download M4B Part 2 32kbps (23MB) Download M4B Part 1 64kbps (100MB) Download M4B Part 2 64kbps (89MB)",
         downloads: 12,
         identifier: "tom_sawyer_librivox",
         itemSize: 2250569699,
         title: "The Adventures of Tom Sawyer"),


    Book(creator: "Catherine Carswell",
         date: "2020-07-28T00:00:00Z",
         description: "",
         downloads: 12,
         identifier: "openthedoor_2007_librivox",
         itemSize: 2250569699,
         title: "Open The Door"),


    Book(creator: "Doyle, Sir Arthur Conan",
         date: "2020-07-28T00:00:00Z",
         description: "Librivox recording of the Adventures of Sherlock Holmes. The Adventures of Sherlock Holmes is a collection of twelve stories by Arthur Conan Doyle, featuring his famous detective. They were originally published in the Strand Magazine from July 1891 to June 1892. The title character was named after famous American poet Oliver Wendell Holmes, Sr. (Summary from Wikipedia) For further information, including links to online text, reader information, RSS feeds, CD cover,m4b or other formats (if available), please go to the LibriVox catalog page for this recording. For more free audiobooks, or to become a volunteer reader, please visit librivox.org .",
         downloads: 12,
         identifier: "adventures_holmes",
         itemSize: 2250569699,
         title: "The Adventures of Sherlock Holmes"),


]
