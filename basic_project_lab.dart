int sumDigits(int number) {
  if (number <= 0) {
    return number;
  }

  int sum = 0;
  while (number > 0) {
    sum += number % 10; 
    number ~/= 10;
  }
  return sum;
}

void main() {
  print(sumDigits(123));      
  print(sumDigits(5));       
  print(sumDigits(-1));      
  print(sumDigits(-123));     
  print(sumDigits(345321));  
}
