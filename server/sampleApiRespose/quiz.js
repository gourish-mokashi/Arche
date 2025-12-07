// API 1
// to get or create a quiz for a subtopic

// GET http://localhost:5000/api/quizzes/start?subTopicId=cmid8wglp0008ijj3daig2vo6

// sample response
// {
//   "success": true,
//   "data": {
//     "id": "cmivol0wy0001ijvpz7beqoko",
//     "subTopicId": "cmid8wglp0008ijj3daig2vo6",
//     "questions": [
//       {
//         "id": "cmivol0wy0002ijvpc0rbnsr2",
//         "description": "Which layer of the OSI model is responsible for the physical transmission of raw bit streams over a medium?",
//         "options": [
//           "Data Link Layer",
//           "Physical Layer",
//           "Network Layer",
//           "Transport Layer"
//         ]
//       },
//       {
//         "id": "cmivol0wy0003ijvp4o5ht6eo",
//         "description": "At which layer of the OSI model do MAC addresses operate to identify devices within a local network segment?",
//         "options": [
//           "Network Layer",
//           "Physical Layer",
//           "Data Link Layer",
//           "Transport Layer"
//         ]
//       },
//       {
//         "id": "cmivol0wy0004ijvplcdezdmr",
//         "description": "What is the primary function of the Network Layer in the OSI model?",
//         "options": [
//           "Error detection and correction within a segment",
//           "End-to-end communication and segmentation",
//           "Logical addressing and routing of packets",
//           "Data encryption and compression"
//         ]
//       },
//       {
//         "id": "cmivol0wz0005ijvpvpo7mt95",
//         "description": "The Transport Layer is responsible for which of the following?",
//         "options": [
//           "Defining electrical specifications for cables",
//           "Establishing and managing sessions between applications",
//           "End-to-end communication, segmentation, and flow control",
//           "Providing network services to end-user applications"
//         ]
//       },
//       {
//         "id": "cmivol0wz0006ijvph52y75kr",
//         "description": "Which layer of the OSI model is concerned with establishing, managing, and terminating communication sessions between applications?",
//         "options": [
//           "Application Layer",
//           "Presentation Layer",
//           "Session Layer",
//           "Transport Layer"
//         ]
//       },
//       {
//         "id": "cmivol0wz0007ijvpnbca0qrv",
//         "description": "Data encryption, decryption, and compression are functions performed at which layer of the OSI model?",
//         "options": [
//           "Session Layer",
//           "Application Layer",
//           "Presentation Layer",
//           "Transport Layer"
//         ]
//       },
//       {
//         "id": "cmivol0wz0008ijvpuf4h689b",
//         "description": "Which layer provides network services directly to end-user applications, such as email, file transfer, and web browsing?",
//         "options": [
//           "Presentation Layer",
//           "Session Layer",
//           "Application Layer",
//           "Transport Layer"
//         ]
//       },
//       {
//         "id": "cmivol0wz0009ijvptrx0bz0j",
//         "description": "What is the Protocol Data Unit (PDU) at the Network Layer commonly referred to as?",
//         "options": [
//           "Segment",
//           "Frame",
//           "Packet",
//           "Bit"
//         ]
//       },
//       {
//         "id": "cmivol0wz000aijvpy1ro6l8o",
//         "description": "A Layer 2 switch primarily operates at which layer of the OSI model?",
//         "options": [
//           "Physical Layer",
//           "Data Link Layer",
//           "Network Layer",
//           "Transport Layer"
//         ]
//       },
//       {
//         "id": "cmivol0wz000bijvpxb8fvwt2",
//         "description": "Routers are most closely associated with the functionalities of which OSI layer?",
//         "options": [
//           "Data Link Layer",
//           "Network Layer",
//           "Transport Layer",
//           "Physical Layer"
//         ]
//       },
//       {
//         "id": "cmivol0wz000cijvpfflpt4uh",
//         "description": "In the OSI model, which layer comes directly above the Data Link Layer?",
//         "options": [
//           "Physical Layer",
//           "Network Layer",
//           "Transport Layer",
//           "Session Layer"
//         ]
//       },
//       {
//         "id": "cmivol0wz000dijvpoahfdmki",
//         "description": "Protocols like TCP and UDP operate at which layer of the OSI model?",
//         "options": [
//           "Application Layer",
//           "Session Layer",
//           "Transport Layer",
//           "Network Layer"
//         ]
//       },
//       {
//         "id": "cmivol0wz000eijvpjermd4wp",
//         "description": "Which layer ensures that data is readable by the receiving application by handling data format conversion?",
//         "options": [
//           "Application Layer",
//           "Presentation Layer",
//           "Session Layer",
//           "Data Link Layer"
//         ]
//       },
//       {
//         "id": "cmivol0wz000fijvp710ko932",
//         "description": "Error detection and correction, along with flow control within a single network link, are the responsibilities of which layer?",
//         "options": [
//           "Physical Layer",
//           "Network Layer",
//           "Data Link Layer",
//           "Transport Layer"
//         ]
//       },
//       {
//         "id": "cmivol0wz000gijvpljwq4s23",
//         "description": "Which layer deals with the activation, maintenance, and deactivation of the physical connection?",
//         "options": [
//           "Data Link Layer",
//           "Network Layer",
//           "Physical Layer",
//           "Session Layer"
//         ]
//       },
//       {
//         "id": "cmivol0wz000hijvpbtuyus2t",
//         "description": "HTTP, FTP, and SMTP are examples of protocols that primarily operate at which layer?",
//         "options": [
//           "Transport Layer",
//           "Presentation Layer",
//           "Application Layer",
//           "Session Layer"
//         ]
//       },
//       {
//         "id": "cmivol0wz000iijvpsypm4sat",
//         "description": "The process of segmenting data from the Session Layer for transmission and reassembling it at the destination occurs at which layer?",
//         "options": [
//           "Network Layer",
//           "Physical Layer",
//           "Transport Layer",
//           "Data Link Layer"
//         ]
//       }
//     ]
//   }
// }


// API 2
// to submit quiz answers and get score
// POST    http://localhost:5000/api/quizzes/answers

// sample request body

// {
//     "quizId": "cmivol0wy0001ijvpz7beqoko",
//     "answers": {
//   ------ QuestionId : Selected Option -----
//         "cmivol0wy0001ijvpz7beqoko" : "Physical Layer",
//         "cmivol0wy0003ijvp4o5ht6eo" : "Data Link Layer",
//         "cmivol0wy0004ijvplcdezdmr" : "Error detection and correction within a segment",
//         "cmivol0wz0005ijvpvpo7mt95" : "Establishing and managing sessions between applications",
//         "cmivol0wz0006ijvph52y75kr" :  "Establishing and managing sessions between applications",
//         "cmivol0wz0007ijvpnbca0qrv" : "Presentation Layer",
//         "cmivol0wz0008ijvpuf4h689b" : "Presentation Layer",
//         "cmivol0wz0009ijvptrx0bz0j" : "Packet",
//         "cmivol0wz000aijvpy1ro6l8o" :"Data Link Layer",
//         "cmivol0wz000bijvpxb8fvwt2" : "Network Layer",
//         "cmivol0wz000cijvpfflpt4uh" :"Network Layer",
//         "cmivol0wz000dijvpoahfdmki" :"Transport Layer",
//         "cmivol0wz000eijvpjermd4wp" :"Application Layer",
//         "cmivol0wz000fijvp710ko932" :"Transport Layer",
//         "cmivol0wz000gijvpljwq4s23" :"Physical Layer",
//         "cmivol0wz000hijvpbtuyus2t" :"Application Layer",
//         "cmivol0wz000iijvpsypm4sat" : "Network Layer"
//     } 
// }

// sample response
// {
//   "success": true,
//   "data": {
//     "score": 9,
//     "totalQuestions": 17,
//     "result": "failed"  // if above 70% then  the value will be "passed"
//   }
// }