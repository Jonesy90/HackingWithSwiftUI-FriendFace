## Hacking With SwiftUI - FriendFace

### Overview/Description
I created this project from scratch, using the knowledge I was taught in the previous projects on Hacking With SwiftUI. Overall, it was quite a simple task of reading JSON data from an external source and displaying the data in a List. With each element in the list pushing to a new view (UserDetailView) to display details of that particular dataset (User).

### What I Learned
1. I broke up my code into directories to add a bit of structure to the codebase. I created a Model folder to hold the JSON model schemas (User and Friend).
2. The two models created (User and Friend) handled the expected output from the JSON dataset. The introduction of CodingKeys was new to me, but from what I understand it's used to match my Swift property names with the JSON keys provided.
3. Also in the two models (User and Friend), I made sure both conform to the Codable protocol. Because they both conform to Codable, the model classes required a custom initialiser method to handle decoding the JSON and a encodable method to handle any encoding work. Becuase this project only required JSON to be decoded, I could have conformed the classes to Decodable instead of Codable.
4. There was a Apple code-along tutorial which created a DataContainer class and configured SwiftData within there, this is something I tried to implement instead of the HWS route. From what I understand, the design is set up a model container, provide an easy way to access the model container and optionally load sample data.

### What it looks like
<img width="330" height="717" alt="Simulator Screenshot - iPhone 17 Pro Max - 2026-06-26 at 17 19 55" src="https://github.com/user-attachments/assets/cdbd3cf9-14e9-4786-96d1-a3e5364bf622" />
<img width="330" height="717" alt="Simulator Screenshot - iPhone 17 Pro Max - 2026-06-26 at 17 20 01" src="https://github.com/user-attachments/assets/f8e26e46-3e79-4bc3-b06c-ad001134db57" />

## Other Challenges:
TBC
