class SliderImageModel{

  String imagePath;
  String title;
  String desc;

  SliderImageModel({this.imagePath, this.title, this.desc});

  void setImageAssetPath(String getImagePath){
    imagePath = getImagePath;
  }

  void setTitle(String getTitle){
    title = getTitle;
  }

  void setDesc(String getDesc){
    desc = getDesc;
  }

  String getImageAssetPath(){
    return imagePath;
  }

  String getTitle(){
    return title;
  }

  String getDesc(){
    return desc;
  }

}

List<SliderImageModel> getSlides(){

  List<SliderImageModel> slides = new List<SliderImageModel>();
  //Define Model here
  SliderImageModel sliderImageModel = new SliderImageModel();
  
  //image 1
  sliderImageModel.setImageAssetPath('assets/mountains.jpg');
  sliderImageModel.setTitle('Mountain Views');
  sliderImageModel.setDesc('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.');
  //add model to list
  slides.add(sliderImageModel);

  sliderImageModel = new SliderImageModel();

  //image 2
  sliderImageModel.setImageAssetPath('assets/road.jpg');
  sliderImageModel.setTitle('Road Trip Views');
  sliderImageModel.setDesc('Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source.');
  //add model to list
  slides.add(sliderImageModel);

  sliderImageModel = new SliderImageModel();

  //image 3
  sliderImageModel.setImageAssetPath('assets/sunset.jpeg');
  sliderImageModel.setTitle('Sunset Views');
  sliderImageModel.setDesc('There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which dont look even slightly believable.');
  //add model to list
  slides.add(sliderImageModel);

  return slides;
}