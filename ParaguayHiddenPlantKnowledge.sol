// SPDX-License-Identifier: MIT
pragma solidity 0.8.31;

/// @title Paraguay Hidden Plant Knowledge Registry
/// @notice On-chain registry of real, lesser-known indigenous plant knowledge and traditional uses from Paraguay, with community voting.
/// @dev Country-specific: focused on Paraguay's Guarani-rooted botanical knowledge and ancestral ecological practices.

contract ParaguayHiddenPlantKnowledge {

    struct PlantKnowledge {
        string region;          // e.g., Amambay, Caaguazu, Alto Parana
        string community;       // specific indigenous or rural community
        string plantName;       // name of the plant (local or common)
        string useType;         // medicinal, ritual, food, craft, etc.
        string culturalNote;    // brief factual context or origin
        string whyItMatters;    // cultural significance
        address creator;
        uint256 likes;
        uint256 dislikes;
        uint256 createdAt;
    }

    PlantKnowledge[] public entries;

    mapping(uint256 => mapping(address => bool)) public hasVoted;

    event PlantKnowledgeRecorded(uint256 indexed id, string plantName, string community, address indexed creator);
    event PlantKnowledgeVoted(uint256 indexed id, bool like, uint256 likes, uint256 dislikes);

    constructor() {
        entries.push(
            PlantKnowledge({
                region: "Amambay",
                community: "ExampleCommunity",
                plantName: "Example Plant (replace with real entries)",
                useType: "example type",
                culturalNote: "This is an example entry to illustrate the format.",
                whyItMatters: "Real entries should describe cultural and ecological relevance.",
                creator: address(0),
                likes: 0,
                dislikes: 0,
                createdAt: block.timestamp
            })
        );
    }

    /// @notice Record a new hidden plant knowledge entry from Paraguay.
    function recordPlantKnowledge(
        string calldata region,
        string calldata community,
        string calldata plantName,
        string calldata useType,
        string calldata culturalNote,
        string calldata whyItMatters
    ) external {
        require(bytes(region).length > 0, "Region required");
        require(bytes(community).length > 0, "Community required");
        require(bytes(plantName).length > 0, "Plant name required");

        entries.push(
            PlantKnowledge({
                region: region,
                community: community,
                plantName: plantName,
                useType: useType,
                culturalNote: culturalNote,
                whyItMatters: whyItMatters,
                creator: msg.sender,
                likes: 0,
                dislikes: 0,
                createdAt: block.timestamp
            })
        );

        emit PlantKnowledgeRecorded(entries.length - 1, plantName, community, msg.sender);
    }

    /// @notice Vote on whether a recorded plant knowledge entry is culturally relevant or useful.
    function votePlantKnowledge(uint256 id, bool like) external {
        require(id < entries.length, "Invalid ID");
        require(!hasVoted[id][msg.sender], "Already voted");

        hasVoted[id][msg.sender] = true;

        PlantKnowledge storage p = entries[id];

        if (like) {
            p.likes += 1;
        } else {
            p.dislikes += 1;
        }

        emit PlantKnowledgeVoted(id, like, p.likes, p.dislikes);
    }

    /// @notice Returns the total number of recorded plant knowledge entries.
    function totalEntries() external view returns (uint256) {
        return entries.length;
    }
}
