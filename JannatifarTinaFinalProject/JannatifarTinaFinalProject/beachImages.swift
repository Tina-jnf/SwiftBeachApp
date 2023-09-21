import Foundation
import SwiftUI
import UIKit
import GooglePlaces
//this class uses the google places api key + the places IDs for each beach to show their image, i had to do this manually because google places does not give us the option to just get the place ids for many places at once and they should be manually entered in the code
class beachImages: UIViewController{
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var lblText: UILabel!
    static let shared = beachImages()
    //private init(){}
    let ACCESS_KEY="AIzaSyBuMBXeiC5yjjNqVyYVSc3BMrV9bXXBt5c";
    let BASE_URL="https://mapsplatform.google.com";
    var images: [imageStruct] =  []
    var sortedLikes:[Int] = []
    var selectIndex: Int = 0;
    var placesClient: GMSPlacesClient?
    let placeID1="ChIJe1OXllYY6IARhBZQ3k0fXTE"
    let placeID2="ChIJcTdrU4yjwoARvqtx37Ly-X0"
    let placeID3="ChIJu-fN2lihwoARst1A0A24cJo"
    let placeID4="ChIJRRBkmSulwoARC9tR7sO6xg0"
    let placeID5="ChIJE84vfpm6woARlSChHKhRytU"
    let placeID6="ChIJLRdiGBihwoARAPeyh9rCgP8"
    let placeID7="ChIJq0gBNIyjwoARsS_bVAJ7CrM"
    let placeID8="ChIJL3i7st0Y6IAR1yFVaBrTMdg"
    let placeID9="ChIJ512buqS6woAReLLWQupEX2A"
    let placeID10="ChIJ09fP-kKhwoARbHI1812u3uM"
    let placeID11="ChIJLaqddXikwoAR-lw_8UVHtak"
    let placeID12="ChIJv5V7sVihwoARzsvtB2SFJJI"
    let placeID13="ChIJEz2SxOWjwoARul2vAlDA4as"
    let placeID14="ChIJJQs6ui4e6IARAicMaPH65EM"
    let placeID15="ChIJretUoxkf6IARP-a1oVUmPC0"
    let placeID16="ChIJpwv-yCUw3YAR-FLtugATzAA"
    let placeID17="ChIJLdGWCRsf6IARSLWJe0trK_A"
    let placeID18="ChIJgbPSmQYZ6IAR0B2yaANBD5E"
    let placeID19="ChIJgR6jrls96IARK5jsg2fUeiQ"
    let placeID20="ChIJpwjlAm6xwoARvh-h_Quawek"
   
    override func viewDidLoad() {
        super.viewDidLoad()
        placesClient = GMSPlacesClient.shared()
        print(namesTableViewController.num)
        if namesTableViewController.num==0{
            getImages(place:placeID1)
            lblText.text="Point Dume Beach"
        }
        else if(namesTableViewController.num==1){
            getImages(place: placeID2)
            lblText.text=" Malibu Beach"
        }
        else if(namesTableViewController.num==2){
            getImages(place: placeID3)
            lblText.text="Topanga Beach"

        }
        else if(namesTableViewController.num==3){
            getImages(place: placeID4)
            lblText.text="Santa Monica State Beach"

        }
       else if namesTableViewController.num==4{
            getImages(place:placeID5)
            lblText.text="Marina Beach"

        }
       else if namesTableViewController.num==5{
            getImages(place:placeID6)
            lblText.text="Big Rock Beach"

        }
       else if namesTableViewController.num==6{
            getImages(place:placeID7)
            lblText.text="Sunset Beach"

        }
       else if namesTableViewController.num==7{
            getImages(place:placeID8)
            lblText.text="Paradise Cove Beach"

        }
       else if namesTableViewController.num==8{
            getImages(place:placeID9)
            lblText.text="Veice Beach"

        }
       else if namesTableViewController.num==9{
            getImages(place:placeID10)
            lblText.text="Las Tunas Beach"

        }
       else if namesTableViewController.num==10{
            getImages(place:placeID11)
            lblText.text="Will Rogers State Beach"

        }
       else if namesTableViewController.num==11{
            getImages(place:placeID12)
            lblText.text="Rocky Beach"

        }
       else if namesTableViewController.num==12{
            getImages(place:placeID13)
            lblText.text="Ratner Beach"

        }
       else if namesTableViewController.num==13{
            getImages(place:placeID14)
            lblText.text="Malibu Lagoon State Beach"

        }
       else if namesTableViewController.num==14{
            getImages(place:placeID15)
            lblText.text="Dan Blocker Beach"

        }
       else if namesTableViewController.num==15{
            getImages(place:placeID16)
           lblText.text="Mothers Beach Beach"

        }
       else if namesTableViewController.num==16{
            getImages(place:placeID17)
            lblText.text="Corral State Beach"

        }
       else if namesTableViewController.num==17{
            getImages(place:placeID18)
            lblText.text="Pirate's Cove Beach Beach"

        }
       else if namesTableViewController.num==18{
            getImages(place:placeID19)
            lblText.text="El Matador Beach"

        }
       else if namesTableViewController.num==19{
            getImages(place:placeID20)
            lblText.text="El Segundo Beach"
        }
    }
 //this function is written using the help of the google places website for developers
    func getImages(place:String)
    {
        print("in get Image func");
        let fields: GMSPlaceField = GMSPlaceField(rawValue: UInt(GMSPlaceField.photos.rawValue))
        placesClient?.fetchPlace(fromPlaceID: place,
                                 placeFields: fields,
                                 sessionToken: nil, callback: {
            (place: GMSPlace?, error: Error?) in
            if let error = error {
                print("An error occurred: \(error.localizedDescription)")
                return
            }
            if let place = place {
                // Get the metadata for the first photo in the place photo metadata list.
                let photoMetadata: GMSPlacePhotoMetadata = place.photos![1]
                
                // Call loadPlacePhoto to display the bitmap and attribution.
                self.placesClient?.loadPlacePhoto(photoMetadata, callback: { (photo, error) -> Void in
                    if let error = error {
                        // TODO: Handle the error.
                        print("Error loading photo metadata: \(error.localizedDescription)")
                        return
                    } else {
                        // Display the first image
                        self.imageView?.image = photo;
                    }
                })
            }
        })
    }
   
}
   
