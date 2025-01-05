class OnboardingContent {
  String image;
  String title;
  String description;
  OnboardingContent(
      {required this.image, required this.title, required this.description});
}

List<OnboardingContent> contents = [
  OnboardingContent(
      description:
          "Docinho ou salgadinho? Temos de tudo para adoçar e alegrar o seu dia. Escolha o que faz seu coração bater mais forte!",
      image: 'assets/images/onboard-1.png',
      title: "Sabores Que Encantam!"),
  OnboardingContent(
      description:
          "Levamos cada pedido com cuidado e muito amor, para que sua comida chegue quentinha, fresquinha e com gostinho de abraço.",
      image: 'assets/images/onboard-2.png',
      title: "De Nós Para Você ❤️"),
  OnboardingContent(
      description:
          "Com apenas alguns cliques, escolha suas delícias favoritas e deixe o resto com a gente. É simples, rápido e cheio de carinho!",
      image: 'assets/images/onboard-3.png',
      title: "Um Toque de Magia na Sua Mesa 🌸"),
];
