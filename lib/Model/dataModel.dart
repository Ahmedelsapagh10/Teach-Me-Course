class ChannelName {
  final String name;
  final String imageUrl;
  ChannelName({required this.name, required this.imageUrl});
}

ChannelName channel = ChannelName(
    name: 'Ahmed Elsapagh',
    imageUrl:
        'https://media.licdn.com/dms/image/D4D03AQFPV4caV71mPA/profile-displayphoto-shrink_800_800/0/1676385998683?e=1683158400&v=beta&t=dBqTcTgnKi3qLSgfbsQSm4r3SXqgha-4EYPZ8bvADsw');

class VideoModel {
  final String id;
  final String title;
  final ChannelName channelName;

  final String duration;

  VideoModel({
    required this.id,
    required this.title,
    required this.channelName,
    required this.duration,
  });
}
