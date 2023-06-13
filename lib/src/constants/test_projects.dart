class Project {
  const Project({
    required this.title,
    required this.description,
    required this.techTags,
    this.imageLink,
    this.appStoreLink,
    this.googlePlayLink,
    this.youtubeLink,
    this.githubLink,
    this.demoLink,
  });

  final String title;
  final String description;
  final List<String> techTags;

  final String? imageLink;

  final String? appStoreLink;
  final String? googlePlayLink;
  final String? youtubeLink;
  final String? githubLink;
  final String? demoLink;
}

const kTestProjects = [
  Project(
    title: "FastTrack",
    description: """
    A Fasting Timer & Tracker app for iOS. It tracks the hours you are in the fasted state (every hour after the 12th hour mark since your last meal) to keep you committed to reaching your weekly goal.
    
    Available on iPhone, iPad, Apple Watch as a companion app, and Mac computers with Apple Silicon as an unmodified iOS app. 
    """,
    techTags: [
      "Swift",
      "SwiftUI",
      "Core Data",
      "CloudKit",
      "Timers",
      "App Intents",
    ],
    imageLink: "https://neurothrone.tech/img/projects/fast-track.jpg",
    appStoreLink: "https://apps.apple.com/us/app/fasttrack-fast-timer-tracker/"
        "id1659998801?itsct=apps_box_badge&itscg=30200",
    youtubeLink: "https://youtu.be/lVxYQJYy6OI",
  ),
  Project(
    title: "GasVo (iOS)",
    description: """
    A Gas Pipe Volume Calculator app for iOS that adheres to the NPS standard.

    Available on iPhone, iPad and Mac computers with Apple Silicon as an unmodified iOS app.
    """,
    techTags: [
      "Swift",
      "SwiftUI",
      "Core Data",
      "Custom Swift Package",
    ],
    imageLink: "https://neurothrone.tech/img/projects/gasvo-ios.jpeg",
    appStoreLink: "https://apps.apple.com/us/app/gasvo/"
        "id6444937778?itsct=apps_box_badge&itscg=30200",
  ),
  Project(
    title: "WorkWork (iOS)",
    description: """
    A Task Manager & Tracker app for iOS with a customizable and intuitive user interface, and Cloud sync.

    Available on iPhone, iPad and Mac computers with Apple Silicon as an unmodified iOS app.
    """,
    techTags: [
      "Swift",
      "SwiftUI",
      "Core Data",
      "CloudKit",
      "Custom Swift Package",
    ],
    imageLink: "https://neurothrone.tech/img/projects/workwork-ios.jpeg",
    appStoreLink: "https://apps.apple.com/us/app/workwork-todo-list-tasks/"
        "id1668462162?itsct=apps_box_badge&itscg=30200",
    youtubeLink: "https://youtu.be/i5r_F6PFNCs",
  ),
  Project(
    title: "WorkWork (watchOS)",
    description: """
    A Task Manager & Tracker app for Apple Watch with a customizable and intuitive user interface, and Cloud sync.

    Available on Apple Watch as a standalone app or in conjunction with the iOS app.
    """,
    techTags: [
      "Swift",
      "SwiftUI",
      "Core Data",
      "CloudKit",
      "Custom Swift Package",
    ],
    imageLink: "https://neurothrone.tech/img/projects/workwork-watchos.png",
    appStoreLink: "https://apps.apple.com/us/app/workwork-watch/"
        "id1668598115?itsct=apps_box_badge&itscg=30200",
    youtubeLink: "https://youtu.be/kZScetjSq9E",
  ),
];
