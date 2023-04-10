#include <stdio.h>

struct student {
  char name[50];
  int id;
  int age;
};

int main() {
  struct student s;

  // Getting input from the user
  printf("Enter name: ");
  scanf("%s", s.name);

  printf("Enter ID: ");
  scanf("%d", &s.id);

  printf("Enter age: ");
  scanf("%d", &s.age);

  // Displaying the student details
  printf("\nName: %s", s.name);
  printf("\nID: %d", s.id);
  printf("\nAge: %d", s.age);

  return 0;
}

