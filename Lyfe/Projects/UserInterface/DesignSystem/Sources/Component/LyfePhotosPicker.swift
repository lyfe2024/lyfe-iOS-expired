import SwiftUI
import PhotosUI

public struct LyfePhotosPicker<V>: View where V: View {
    @State private var selectedPhoto: PhotosPickerItem? = nil
    @Binding private var image: Image?
    @Binding private var imageData: Data?
    var view: (() -> V)?
    
    public init(
        image: Binding<Image?>,
        imageData: Binding<Data?>,
        view: (() -> V)? = nil
    ) {
        self._image = image
        self._imageData = imageData
        self.view = view
    }
    
    public var body: some View {
        PhotosPicker(selection: self.$selectedPhoto) {
            self.view?()
        }
        .task(id: self.selectedPhoto) {
            let data = try? await self.selectedPhoto?.loadTransferable(type: Data.self)
            if let data, let uiImage = UIImage(data: data) {
                self.image = Image(uiImage: uiImage.fixedOrientation)
                self.imageData = data
            }
        }
    }
}
