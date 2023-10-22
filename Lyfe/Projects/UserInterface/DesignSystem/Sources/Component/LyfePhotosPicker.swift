import SwiftUI
import PhotosUI

public struct LyfePhotosPicker: View {
    @State private var selectedPhoto: PhotosPickerItem?
    @State private var image: Image?
    
    public init(selectedPhoto: PhotosPickerItem? = nil, image: Image? = nil) {
        self.selectedPhoto = selectedPhoto
        self.image = image
    }
    
    public var body: some View {
        PhotosPicker(selection: self.$selectedPhoto) {
            if let image {
                image
                    .resizable()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                
            } else {
                DesignSystemAsset.avatar.swiftUIImage
            }
        }
        .overlay(alignment: .bottomTrailing) {
            Image("")
        }
        .task(id: self.selectedPhoto) {
            let data = try? await self.selectedPhoto?.loadTransferable(type: Data.self)
            if let data, let uiImage = UIImage(data: data) {
                self.image = Image(uiImage: uiImage.fixedOrientation)
            }
        }
    }
}
