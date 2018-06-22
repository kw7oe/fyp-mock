### Mock Data for FYP application

### Dependencies
- [Ruby](https://www.ruby-lang.org/en/)
- [Sinatra](http://sinatrarb.com/)

### Setup

1. Install `ruby`. Refer to the
[official installation guide](https://www.ruby-lang.org/en/documentation/installation/)
2. `gem install sinatra` to install the dependency.
3. `ruby app.rb` to run the server

#### 1. Get class details of a course

Definition:

```
GET http://localhost:4567/courses/:id
```

Example Reponse:

```
{
  "id": "1",
  "classes": [
    {
      "group_id": 1,
      "dates": [
        "12/07/2017",
        "14/07/2017",
        "16/07/2017",
        "22/07/2017",
        "24/07/2017"
      ]
    },
    {
      "group_id": 2,
      "dates": [
        "11/07/2017",
        "15/07/2017",
        "16/07/2017",
        "21/07/2017",
        "23/07/2017"
      ]
    }
  ]
}
```

#### 2. Get attendance

Definition:

```
GET http://localhost:4567/attendance?course_id={course_id}&date={date}&group_id={group_id}
```

Example Reponse:

```
{
  "course_id": "1",
  "date": "24/08/2017",
  "group_id": "1",
  "attended": [
    "15053648",
    "15032412",
    "15023412"
  ],
  "excuse": [],
  "absent": [
    "14023122",
    "13021321"
  ]
}
```

#### 3. Get students of a course

Definition:
```
GET http://localhost:4567/courses/:id/students
```

Example Response:
```
{
  "id": "1",
  "students": [
    [
      "Concepcion Streich",
      "14635668@imail.sunway.edu.my",
      14635668,
      "646-97-9199",
      "Malaysian",
      "968.641.3561",
      "11/02/1998",
      "BCNS",
      "201601",
      8
    ],
    [
      "Oda Ritchie",
      "14292323@imail.sunway.edu.my",
      14292323,
      "600-03-3679",
      "Malaysian",
      "(890) 404-1349",
      "02/12/1998",
      "BCNS",
      "201708",
      3
    ],
    [
      "Ella Rohan",
      "12361363@imail.sunway.edu.my",
      12361363,
      "042-17-1987",
      "Malaysian",
      "(384) 734-7791",
      "08/02/1999",
      "BCNS",
      "201503",
      10
    ],
    ...
  ]
}
```

