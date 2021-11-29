enum Menu { home, about, skills, experience, contact }

extension MenuEx on Menu {
  String get title {
    switch (this) {
      case Menu.home:
        return 'HOME';
      case Menu.about:
        return 'ABOUT';
      case Menu.skills:
        return 'SKILLS';
      case Menu.experience:
        return 'EXPEIENCE';
      case Menu.contact:
        return 'CONTACT';
    }
  }
}
