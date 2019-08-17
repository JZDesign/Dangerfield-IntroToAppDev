## Getting Started

### Starting the project

#### Step One
##### Using Kanban

Go to [Projects](https://github.com/JZDesign/Dangerfield-IntroToAppDev/projects), select the current project, and pull the first card.

  - Click and drag it from the top of the `To Do` to `In Progress`

#### Step Two
##### Clone the repo and build the dependencies

Open your terminal and clone this repository `git clone  https://github.com/JZDesign/Dangerfield-IntroToAppDev.git`

After you've pulled it down navigate to the project's root directory (where the `Carthage` directory is) and run `carthage bootstrap --platform iOS`

#### Step Three

##### Switch to a new branch: 
  
  In your terminal, make sure you're in the `Dangerfield-IntroToAppDev` directory
    
  `git checkout -b {{NAME_OF_NEW_BRANCH}}`  switches to and creates a new branch.

#### Step 4

##### Publish the branch and open a pull request.

Make a change to the `ViewController` class. Anything at all, like a print statement. Having changes committed will allow you to do a "pull request" on github.

In your terminal

`git add .`

`git commit -m "{{WHATEVER MESSAGE YOU DESIRE}}"`

`git push --set-upstream origin {{NAME_OF_YOUR_BRANCH}}`

Then come back to this repo and you should see a yellow bar up top for you to open a Pull Request on your new branch.

#### Step 5

##### Code Review

Wait for my review so we can merge it into master. When we're done with this step we'll start coding.

## How we work

### Kanban

#### Columns

|To Do|In progress|Done|
|-------|-------|----|

#### Board

  > We will utilize [Github Projects](https://github.com/JZDesign/Dangerfield-IntroToAppDev/projects) to act as our Kanban Board.
  
#### What is Kanban?
  
Kanban is a methodology that businesses use to boost productivity. Its sole purpose is to create an environment that increases the _"Flow"_ of the work being done, which is measured by the tickets moving across the board. We'll start with a few columns. Work that needs to be done is on the left in `To Do`. Work that you'll be actively working on is in `In Progress` and when you're done it moves to `Done`.

Kanban manages flow by restricting how many tasks each developer does at once. For the sake of teaching you Kanban we will be restricting you to ONE card at a time. This should allow work to move quickly and in small chunks as long as we gauge the work and make the cards small enough.

#### Pulling from the board

Generally all cards should be pulled from the `TOP` of the `To Do` or `Backlog` Column. 

Only have 1 card in `In Progress` or `Doing` at a time.

When the card is in `In Progress`, the person working on it can't move it to the next column, (in Kanban it's referred to as pushing work: see below) it needs to be _pulled_ there by another person. For the sake of moving quickly we'll ignore this rule. When the work is finished for a ticket you can pull it to `Done`.

When the card is pulled into `Done`, you can pull a new card from the `To Do` column.

#### Pushing Work

There is a rule of `NO PUSHING WORK` in Kanban. That typically would apply in a team environment where you have Quality Assurance or other developers that will take the card from you when you're done so they could work on the next piece of the task. `NO PUSHING WORK` means that when you're done with the card in the `In Progress` column, you couldn't move it to the `Done` column yourself. Instead you would wait for QA or another developer to `PULL` the work from you. Until that happens you are in what is referred to as `SLACK` time. 

#### Slack

`SLACK` time is time that you can utilize however you want EXCEPT for working on the next cards. We often use this time to write documentation, learn stuff, explore ideas (which often end up as part of our products), or help other people with their work. 

### Writing code

I will not write any code in this project. I will only review, coach, and guide you. Sometimes that may result in me recommending refactors with very specific chunks of code, but for the most part, this will be written entirely by you.


