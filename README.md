A Flutter package for getting app feedback from users. This package gives you flexible way to get feedback from user, you can add main question, positive question (in case of positive response), negative question (in case of negatieve response) and list of points to ask why user like or don't like the app.

#### **1. Create a instance of CasaFeedbackModel**
```
CasaFeedbackModel casaFeedbackModel = CasaFeedbackModel(
    id: '1',
    mainQuestion: 'Hey! How was your day today?',
    subtitle: 'Your feedback is really valueable for us.',
    okayQuestion: 'Whats wrong?',
    likeQuestion: 'Whats wrong?',
    dislikeQuestion: 'Whats wrong?',
    multiSelection: true,
    userPointChoice: [],
    points: [
        "Siding Foreman",
        "Electrical",
        "Roofing",
        "Roofing Foremen",
        "Window Foremen",
        "Plumbing",
    ],
);
```

#### **2. Show CasaFeedBack View**
```
CasaFeedback.show(context, casaFeedbackModel: casaFeedbackModel);
```


Main question  |  What you like most (Positive response view)     
:-------------------------:|:-------------------------:
![](https://github.com/techroomteam/casa_flutter_feedback/raw/master/screenshots/1.png)|![](https://github.com/techroomteam/casa_flutter_feedback/raw/master/screenshots/2.png)

Add comment  |  Success view  
:-------------------------:|:-------------------------:
![](https://github.com/techroomteam/casa_flutter_feedback/raw/master/screenshots/3.png)|![](https://github.com/techroomteam/casa_flutter_feedback/raw/master/screenshots/4.png)
