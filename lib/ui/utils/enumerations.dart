enum Menu { home, about, skill, experience, contact }

extension MenuEx on Menu {
  String get title {
    switch (this) {
      case Menu.home:
        return 'Home';
      case Menu.about:
        return 'About';
      case Menu.skill:
        return 'Skills';
      case Menu.experience:
        return 'Experience';
      case Menu.contact:
        return 'Contact';
    }
  }
}
