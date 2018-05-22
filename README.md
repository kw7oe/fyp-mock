### Mock Data for FYP application

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
  "date": "2017-08-24",
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


