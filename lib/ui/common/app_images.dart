class AppImages {
  AppImages._();

  static const String walletBackdrop = 'assets/images/wallet.png';

  static const String chatBackdrop = 'assets/images/background.png';
}

class AppNetworkImages {
  AppNetworkImages._();

  static const String personOne =
      "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fFBFT1BMRXxlbnwwfHwwfHx8MA%3D%3D";
  static const String personTwo =
      "https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8UEVPUExFfGVufDB8fDB8fHww";
  static const String personThree =
      "https://images.unsplash.com/photo-1506277886164-e25aa3f4ef7f?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fFBFT1BMRXxlbnwwfHwwfHx8MA%3D%3D";

  static const String personFour =
      "https://images.unsplash.com/photo-1517841905240-472988babdf9?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8UEVPUExFfGVufDB8fDB8fHww";

  static List<String> get personImages =>
      [personOne, personTwo, personThree, personFour];

  static List<String> get personImagesWithName => [
        "John",
        "Jane",
        "Mike",
        "Sarah",
      ];
}
