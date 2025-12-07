import  { Router } from 'express';
import { createQuiz } from '../controllers/quizController.js';

const quizRouter = Router();

// quizRouter.post('/answers', );

quizRouter.get('/start', createQuiz);   

export default quizRouter;