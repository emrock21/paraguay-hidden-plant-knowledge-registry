# Paraguay Hidden Plant Knowledge Registry

On-chain registry of real, lesser-known indigenous plant knowledge and traditional uses from Paraguay.

This contract focuses on botanical practices that are culturally significant but not widely documented, such as:

- Guarani medicinal plants  
- Mbya ritual resins and barks  
- Ache foraging knowledge  
- Rural herbal blends and remedies  
- Ancestral ecological practices tied to forest life  

Each entry is tied to a specific Paraguayan region and community, emphasizing cultural context rather than generic plant data.

---

## Why a country-specific contract?

Paraguay holds one of the richest indigenous botanical traditions in South America.  
Many of its most meaningful plant uses are:

- Preserved in forest communities  
- Transmitted orally across generations  
- Central to health, ritual life, and ecological understanding  

A global “plant registry” would dilute this context.  
This registry is explicitly designed for Paraguay’s indigenous and rural plant knowledge.

---

## Contract

Deployed on Base:  
`0xcc0a62f75cb2a6342e727ff499a6176b023ecabd`  
🔗 https://basescan.org/address/0xcc0a62f75cb2a6342e727ff499a6176b023ecabd#code

---

## Data model

Each recorded entry includes:

- `region` – e.g., Amambay, Caaguazu, Alto Parana  
- `community` – specific indigenous or rural community  
- `plantName` – name of the plant  
- `useType` – medicinal, ritual, food, craft, etc.  
- `culturalNote` – brief factual context  
- `whyItMatters` – explanation of cultural significance  
- `likes` / `dislikes` – community voting  

---

## Example entries (conceptual)

These are examples of the kind of knowledge this registry is meant to capture:

- A Guarani medicinal plant used for fever  
- A Mbya resin burned in purification rituals  
- A rural herb used in traditional stews  
- A forest root used for recovery after illness  
- A plant associated with Ache honey-gathering practices  

Frontends and communities are responsible for ensuring that entries are real and culturally meaningful.

---

## Contract interface

solidity

recordPlantKnowledge(
  string region,
  string community,
  string plantName,
  string useType,
  string culturalNote,
  string whyItMatters
);

votePlantKnowledge(uint256 id, bool like);

totalEntries();

---

## Conclusion

This contract provides a country-specific, culturally grounded registry for Paraguay.
It is not a generic plant list, but a curated log of indigenous botanical knowledge that matters to the cultural memory and ecological identity of the nation.
