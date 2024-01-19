enum House{
  gryffindor,
  slytherin,
  hufflepuff,
  ravenclaw,
  noHouse;

  factory House.fromString(String houseName){
    final lowCaseName = houseName.toLowerCase();
    return switch(lowCaseName){
      'gryffindor' => House.gryffindor,
      'slytherin' => House.slytherin,
      'hufflepuff' => House.hufflepuff,
      'ravenclaw' => House.ravenclaw,
      _=>House.noHouse,
    };
  }
}
