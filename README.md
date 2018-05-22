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
      "date": "2017-07-24",
      "group_id": 1
    },
    {
      "date": "2017-07-12",
      "group_id": 2
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
    15053648,
    15032412,
    15023412
  ],
  "excuse": [],
  "absent": [
    14023122,
    13021321
  ]
}
```


