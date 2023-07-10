/// Handles time computation such as converting from minutes to hours. 
class DurationHandler { 

  /// Takes in [minutes] and returns a tuple of the form (Hours, minutes)
  static (int, int) minutesToHoursAndMinutes(int minutes) { 
    int hours = minutes ~/ 60; 
    int minutesLeft = minutes - 60*hours;
    return (hours, minutesLeft);
  }
  
  /// We always want two digit on the screen, for example instead of `3:2`, we want to display `03:02`.
  static String _handleSingleDigit(int number) { 
    if(number ~/ 10 == 0) { 
      return '0$number';
    } else { 
      return '$number';
    }
  } 
  
  /// Takes in [minutes] and output the hours and minutes in string in the format 'Hours:Minutes'.
  static String minutesToString(int minutes) { 
    var (hours, minutes2) = minutesToHoursAndMinutes(minutes);
    var (stringHours, stringMinutes2) = (_handleSingleDigit(hours), _handleSingleDigit(minutes2));
    return '$stringHours:$stringMinutes2';
  }

}