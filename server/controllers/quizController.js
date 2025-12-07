import quizAgent from "../aiAgents/quizAgent.js";
import prisma from "../exports/prisma.js";


async function createQuiz(req, res) {
    const { subTopicId } = req.query;

    if (!subTopicId) {
        return res.status(400).json({ error: "subTopicId is required." });
    }

    try {
        const existingQuiz = await prisma.quiz.findUnique({
            where: { subTopicId },
            include: {
                questions: {
                    select: {
                        id: true,
                        description: true,
                        options: true,
                    }
                },
            },
        });

        if (existingQuiz) {
            // console.log("Existing quiz found:", existingQuiz);
            return res.status(200).json({
                success: true,
                data: existingQuiz,
            });
        }
        else {
            const subTopic = await prisma.subTopic.findUnique({
                where: { id: subTopicId },
            });

            const quiz = await quizAgent(subTopic.description);

            const newQuiz = await prisma.quiz.create({
                // exclude correct answers from response
                data: {
                    subTopicId,
                    questions: {
                        create: quiz.map((q) => ({
                            description: q.question,
                            options: q.options,
                            correctAnswer: q.correct_answer,
                        })),
                    },
                },
                include: {
                    questions: {
                        select: {
                            id: true,
                            description: true,
                            options: true,
                        }
                    },
                },
            });

            return res.status(201).json({
                success: true,
                data: newQuiz,
            });
        }
    } catch (error) {
        console.error("Error in createQuiz:", error);
        return res.status(500).json({ error: "Internal server error." });
    }
}

export { createQuiz };
