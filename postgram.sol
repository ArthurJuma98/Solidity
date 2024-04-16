// SPDX-License-Identifier: MIT

pragma solidity ^0.8.25;

contract Postgram {

    uint16 public MAX_POST_LENGTH = 280;

    //define struct

    struct Post {
        address author;
        string content;
        uint256 timestamp;
        uint256 likes;
        uint256 id;
    }

    //add code
    mapping(address => Post[]) public posts;
    address public owner;

    //define events
    event PostCreated(uint256 id, address author, string content, uint256 timestamp);
    event PostLiked(address liker, address tweetAuthor, uint256 tweetId, uint256 newLikeCount);
    event PostUnliked(address unliker, address tweetAuthor, uint256 tweetId, uint256 newLikeCount);


    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "You are not the owner!");
        _;
    }

    function changePostLength(uint16 newPostLength) public onlyOwner{
        MAX_POST_LENGTH = newPostLength;
    }

    function createPost(string memory _post) public {

        require(bytes(_post).length <= MAX_POST_LENGTH, "Post is too long!");

        Post memory newPost = Post({
            id: posts[msg.sender].length,
            author: msg.sender,
            content: _post,
            timestamp: block.timestamp,
            likes: 0
        });

        posts[msg.sender].push(newPost);

        emit PostCreated(newPost.id, newPost.author, newPost.content, newPost.timestamp);
    }

    function likePost(address author, uint256 id) external{
        require(posts[author][id].id == id, "Post does not exist!");

        posts[author][id].likes++;

        emit PostLiked(msg.sender, author, id, posts[author][id].likes);
    }

    function unlikePost(address author, uint256 id) external{
        require(posts[author][id].id == id, "Post does not exist!");
        require(posts[author][id].id > 0, "Post has no likes");

        posts[author][id].likes--;

        emit PostUnliked(msg.sender, author, id, posts[author][id].likes);
    }

    function getPost(address _owner, uint _i) public view returns(Post memory){
        return posts[_owner][_i];
    }

    function getAllPosts(address _owner) public view returns (Post[] memory) {
        return posts[_owner];
    }

}
