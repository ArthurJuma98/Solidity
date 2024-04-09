
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;


contract Postgram {

    struct Post{
        address author;
        string content;
        uint256 likes;
        uint256 timestamp;
        uint256 id;
    }

    mapping(address => Post[]) public posts;

    function createPost(string memory _post) public {

        Post memory newPost = Post({
            id: posts[msg.sender].length,
            author: msg.sender,
            content: _post,
            timestamp: block.timestamp,
            likes: 0
        });

        posts[msg.sender].push(newPost);
    }

    function getPost(address author, uint _i) public view returns (Post memory){
        return posts[author][_i];
    }

    function getAllPosts(address author) public view returns(Post[] memory){
        return posts[author];
    }
}
