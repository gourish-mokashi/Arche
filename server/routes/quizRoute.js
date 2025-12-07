import  { Router } from 'express';
import { createQuiz, checkQuizAnswer } from '../controllers/quizController.js';

const quizRouter = Router();

quizRouter.post('/answers', checkQuizAnswer);

quizRouter.get('/start', createQuiz);   

export default quizRouter;