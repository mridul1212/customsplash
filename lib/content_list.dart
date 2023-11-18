class UnbordingContent {
  String image;
  String title;
  String discription;

  UnbordingContent({required this.image, required this.title, required this.discription});
}

List<UnbordingContent> contents = [
  UnbordingContent(
      title: 'First See Learning',
      image: 'images/page1.svg',
      discription: "Always keep in touch with your tutor & friends. Let’s get connected!"

  ),
  UnbordingContent(
      title: 'Connect With Everyone',
      image: 'images/page2.svg',
      discription: "Always keep in touch with your tutor & friends. Let’s get connected! "

  ),
  UnbordingContent(
      title: 'Always Fascinated Learning',
      image: 'images/page3.svg',
      discription: "Anywhere, anytime. The time is at your discretion so study whenever you want."

  ),
];