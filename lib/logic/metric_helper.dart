class MetricHelper {
  double convertTo(
      double metricFirst, String? chosenCurrency1, String? chosenCurrency2) {
    var numberous = 1.0;
    double converted = 0.0;
    
    if (chosenCurrency1 == "km") {
      numberous = metricFirst * 100000;
    } else if (chosenCurrency1 == "m") {
      numberous = metricFirst * 100;
    } else if (chosenCurrency1 == "sm") {
      numberous = metricFirst * 1;
    }

    if (chosenCurrency2 == "sm") {
      converted = numberous / 1;
      return converted;
    } else if (chosenCurrency2 == "m") {
      converted = numberous / 100;
      return converted;
    } else if (chosenCurrency2 == "km") {
      converted = numberous / 100000;
      return converted;
    }
    return converted;
  }
}
