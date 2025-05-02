class Project {
  final String title;
  final String description;
  final String imageUrl;
  final String url; // Tambahan

  Project({required this.title, required this.description, required
  this.imageUrl, required this.url});
}

List<Project> projects = [
  Project(
    title: "Portfolio Website",
    description: "Website pribadi untuk menampilkan portofolio",
    imageUrl: "assets/portfolio.png",
    url: "https://github.com/niasur/my_project_flutter/main/portfolio",
  ),
  Project(
    title: "To-Do List App",
    description: "Aplikasi Flutter untuk mengelola tugas harian",
    imageUrl: "assets/todo.png",
    url: "https://todo-app-flutter.vercel.app/",
  ),
];