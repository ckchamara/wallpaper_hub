import '../model/catagories_model.dart';

List<CatagoriesModel> getCatagories() {
  List<CatagoriesModel> catagories = [];
  CatagoriesModel catagoriesModel = new CatagoriesModel();

  catagoriesModel.catagoriesName = "Street Art";
  catagoriesModel.imgUrl =
      "https://images.pexels.com/photos/1647121/pexels-photo-1647121.jpeg?auto=compress&cs=tinysrgb&dpr=1&fit=crop&h=200&w=280";
  catagories.add(catagoriesModel);

  catagoriesModel = new CatagoriesModel();
  catagoriesModel.catagoriesName = "Wild Life";
  catagoriesModel.imgUrl =
      "https://images.pexels.com/photos/247431/pexels-photo-247431.jpeg?auto=compress&cs=tinysrgb&dpr=1&fit=crop&h=200&w=280";
  catagories.add(catagoriesModel);

  catagoriesModel = new CatagoriesModel();
  catagoriesModel.catagoriesName = "Nature";
  catagoriesModel.imgUrl =
      "https://images.pexels.com/photos/15286/pexels-photo.jpg?auto=compress&cs=tinysrgb&dpr=1&fit=crop&h=200&w=280";
  catagories.add(catagoriesModel);

  catagoriesModel = new CatagoriesModel();
  catagoriesModel.catagoriesName = "Family";
  catagoriesModel.imgUrl =
      "https://images.pexels.com/photos/1647121/pexels-photo-1647121.jpeg?auto=compress&cs=tinysrgb&dpr=1&fit=crop&h=200&w=280";
  catagories.add(catagoriesModel);

  catagoriesModel = new CatagoriesModel();
  catagoriesModel.catagoriesName = "City";
  catagoriesModel.imgUrl =
      "https://images.pexels.com/photos/169647/pexels-photo-169647.jpeg?auto=compress&cs=tinysrgb&dpr=1&fit=crop&h=200&w=280";
  catagories.add(catagoriesModel);

  catagoriesModel = new CatagoriesModel();
  catagoriesModel.catagoriesName = "Landscape";
  catagoriesModel.imgUrl =
      "https://images.pexels.com/photos/9355835/pexels-photo-9355835.jpeg?auto=compress&cs=tinysrgb&dpr=1&fit=crop&h=200&w=280";
  catagories.add(catagoriesModel);

  return catagories;
}
